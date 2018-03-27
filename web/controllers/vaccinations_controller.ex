defmodule Cmsv1.VaccinationsController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Vaccinations
  alias Cmsv1.Patient
  alias Cmsv1.VaccBrand

  def index(conn, _params) do
    vaccs = Repo.all(Vaccinations)
    patients = Repo.all(Patient) 
    render(conn, "index.html", vaccs: vaccs, patients: patients)
  end

  def new(conn, _params) do
    changeset = Vaccinations.changeset(%Vaccinations{})
    patients = Repo.all(Patient) |> Enum.map(&{&1.fname<>" "<>&1.lname, &1.patient_id}) |> Enum.into(%{}) 
    brands = Repo.all(VaccBrand) |> Enum.map(&{&1.vaccbrand, &1.vaccbrand}) |> Enum.into(%{})
    render(conn, "new.html", changeset: changeset, patients: patients, brands: brands)
  end

  def create(conn, %{"vaccinations" => vaccinations_params}) do
    changeset = Vaccinations.changeset(%Vaccinations{}, vaccinations_params)
    patients = Repo.all(Patient) |> Enum.map(&{&1.fname, &1.patient_id}) |> Enum.into(%{}) 
    brands = Repo.all(VaccBrand) |> Enum.map(&{&1.vaccbrand, &1.vaccbrand}) |> Enum.into(%{})
    case Repo.insert(changeset) do
      {:ok, _vaccinations} ->
        conn
        |> put_flash(:info, "Vaccinations created successfully.")
        |> redirect(to: vaccinations_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, patients: patients, brands: brands)
    end
  end

  def show(conn, %{"id" => id}) do
    vaccinations = Repo.get!(Vaccinations, id)
    patients = Repo.all(Patient)
    render(conn, "show.html", vaccinations: vaccinations, patients: patients)
  end

  def edit(conn, %{"id" => id}) do
    vaccinations = Repo.get!(Vaccinations, id)
    patients = Repo.all(Patient) |> Enum.map(&{&1.fname<>" "<>&1.lname, &1.patient_id}) |> Enum.into(%{}) 
    brands = Repo.all(VaccBrand) |> Enum.map(&{&1.vaccbrand, &1.vaccbrand}) |> Enum.into(%{})
    changeset = Vaccinations.changeset(vaccinations)
    render(conn, "edit.html", vaccinations: vaccinations, changeset: changeset, patients: patients, brands: brands)
  end

  def update(conn, %{"id" => id, "vaccinations" => vaccinations_params}) do
    vaccinations = Repo.get!(Vaccinations, id)
    changeset = Vaccinations.changeset(vaccinations, vaccinations_params)

    case Repo.update(changeset) do
      {:ok, vaccinations} ->
        conn
        |> put_flash(:info, "Vaccinations updated successfully.")
        |> redirect(to: vaccinations_path(conn, :show, vaccinations))
      {:error, changeset} ->
        render(conn, "edit.html", vaccinations: vaccinations, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vaccinations = Repo.get!(Vaccinations, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vaccinations)

    conn
    |> put_flash(:info, "Vaccinations deleted successfully.")
    |> redirect(to: vaccinations_path(conn, :index))
  end
end
