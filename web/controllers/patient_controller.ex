defmodule Cmsv1.PatientController do
  use Cmsv1.Web, :controller
  import Ecto.Changeset
  import Ecto.Date

  alias Cmsv1.Patient
  alias Cmsv1.CDoctor
  alias Cmsv1.GP
  alias Cmsv1.Pharmacy

  def index(conn, _params) do
    patients = Repo.all(Patient)
    render(conn, "index.html", patients: patients)
  end

  def new(conn, _params) do
    changeset = Patient.changeset(%Patient{})
    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.name, &1.cdoctor_id})
    gps = Repo.all(GP) |> Enum.map(&{&1.name, &1.gp_id})
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id})
    render(conn, "new.html", changeset: changeset, doctors: doctors, gps: gps, pharms: pharms)
  end

  def create(conn, %{"patient" => patient_params}) do
    changeset = Patient.changeset(%Patient{}, patient_params)

    dob = AgeCalc.age(get_change(changeset, :date_of_birth))
    changeset = change(changeset, %{age: dob})
    IO.inspect(changeset)
    
    case Repo.insert(changeset) do
      {:ok, _patient} ->
        conn
        |> put_flash(:info, "Patient created successfully.")
        |> redirect(to: patient_path(conn, :index))
      {:error, changeset} ->
    render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)
    render(conn, "show.html", patient: patient)
  end

  def edit(conn, %{"id" => id}) do
    patient = Repo.get!(Patient, id)
    
    changeset = Patient.changeset(patient)
    render(conn, "edit.html", patient: patient, changeset: changeset)
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
