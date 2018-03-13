defmodule Cmsv1.PatientController do
  use Cmsv1.Web, :controller
  use Drab.Controller

  import Ecto.Changeset
  import Ecto.Date
  

  alias Cmsv1.Patient
  alias Cmsv1.CDoctor
  alias Cmsv1.GP
  alias Cmsv1.Pharmacy
  alias Cmsv1.Inactivity
  alias Cmsv1.Gender
  alias Cmsv1.Relationship

  def index(conn, _params) do
    patients = Repo.all(Patient)
    render(conn, "index.html", patients: patients)
  end

  def new(conn, _params) do
    changeset = Patient.changeset(%Patient{}) 
    
    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id}) |> Enum.into(%{}) 
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id}) |> Enum.into(%{}) 
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id}) |> Enum.into(%{}) 
    inactivity = Repo.all(Inactivity) |> Enum.map(&{&1.reason, &1.reason}) |> Enum.into(%{})
    relations = Repo.all(Relationship) |> Enum.map(&{&1.relationship, &1.relationship}) |> Enum.into(%{})
    genders = Repo.all(Gender) |> Enum.map(&{&1.gender, &1.gender}) |> Enum.into(%{})


    render(conn, "new.html", changeset: changeset, doctors: doctors, gps: gps, pharms: pharms, inactivity: inactivity, genders: genders, relations: relations)
  
  end

  def create(conn, %{"patient" => patient_params}) do
    changeset = Patient.changeset(%Patient{}, patient_params)

    dob = AgeCalc.age(get_change(changeset, :date_of_birth))
    changeset = change(changeset, %{age: dob})

    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id}) |> Enum.into(%{}) 
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id}) |> Enum.into(%{}) 
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id}) |> Enum.into(%{}) 
    inactivity = Repo.all(Inactivity) |> Enum.map(&{&1.reason, &1.reason}) |> Enum.into(%{}) 
    relations = Repo.all(Relationship) |> Enum.map(&{&1.relationship, &1.relationship}) |> Enum.into(%{})
    genders = Repo.all(Gender) |> Enum.map(&{&1.gender, &1.gender}) |> Enum.into(%{})

    case Repo.insert(changeset) do
      {:ok, _patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: patient_path(conn, :index))
      {:error, changeset} ->
    render(conn, "new.html", changeset: changeset, doctors: doctors, gps: gps, pharms: pharms, inactivity: inactivity, genders: genders, relations: relations)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)
    doctor = Repo.get!(CDoctor, patient.cdoctor_id)
    gp = Repo.get!(GP, patient.gp_id)
    pharmacy = Repo.get!(Pharmacy, patient.pharm_id)
    render(conn, "show.html", patient: patient, doctor: doctor, gp: gp, pharmacy: pharmacy)
  end

  def edit(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)

    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id}) |> Enum.into(%{}) 
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id}) |> Enum.into(%{}) 
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id}) |> Enum.into(%{}) 
    inactivity = Repo.all(Inactivity) |> Enum.map(&{&1.reason, &1.reason}) |> Enum.into(%{}) 
    relations = Repo.all(Relationship) |> Enum.map(&{&1.relationship, &1.relationship}) |> Enum.into(%{})
    genders = Repo.all(Gender) |> Enum.map(&{&1.gender, &1.gender}) |> Enum.into(%{})
    
    changeset = Patient.changeset(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset, doctors: doctors, gps: gps, pharms: pharms, inactivity: inactivity, genders: genders, relations: relations)
  end

  def update(conn, %{"id" => id, "patient" => patient_params}) do
    patient = Repo.get!(Patient, id)
    changeset = Patient.changeset(patient, patient_params)

    case Repo.update(changeset) do
      {:ok, patient} ->
        conn
        |> put_flash(:info, "Patient updated successfully.")
        |> redirect(to: patient_path(conn, :show, patient))
      {:error, changeset} ->
        render(conn, "edit.html", patient: patient, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)
    Repo.delete!(patient)

    conn
    |> put_flash(:info, "Patient deleted successfully.")
    |> redirect(to: patient_path(conn, :index))
  end
end
