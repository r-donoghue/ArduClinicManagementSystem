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

  def index(conn, _params) do
    patients = Repo.all(Patient)
    render(conn, "index.html", patients: patients)
  end

  def new(conn, _params) do
    changeset = Patient.changeset(%Patient{})
    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id})
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id})
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id}) |> Enum.into(%{}) 

    inactivity = Repo.all(Inactivity) |> Enum.into(%{}) 
    IO.inspect inactivity
    render(conn, "new.html", changeset: changeset, doctors: doctors, gps: gps, pharms: pharms)
  end

  def create(conn, %{"patient" => patient_params}) do
    changeset = Patient.changeset(%Patient{}, patient_params)

    dob = AgeCalc.age(get_change(changeset, :date_of_birth))
    changeset = change(changeset, %{age: dob})

    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id})
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id})
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id})

    
    
    case Repo.insert(changeset) do
      {:ok, _patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: patient_path(conn, :index))
      {:error, changeset} ->
    render(conn, "new.html", changeset: changeset, doctors: doctors, gps: gps, pharms: pharms)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)
    doctor = Repo.get!(CDoctor, patient.cdoctor_id)
    gp = Repo.get!(GP, patient.gp_id)
    pharmacy = Repo.get!(Pharmacy, patient.pharm_id)
    IO.puts(patient.gp_id)
    render(conn, "show.html", patient: patient, doctor: doctor, gp: gp, pharmacy: pharmacy)
  end

  def edit(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)

    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id})
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id})
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id})
    
    changeset = Patient.changeset(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset, doctors: doctors, gps: gps, pharms: pharms)
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

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(patient)

    conn
    |> put_flash(:info, "Patient deleted successfully.")
    |> redirect(to: patient_path(conn, :index))
  end
end
