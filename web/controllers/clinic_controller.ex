defmodule Cmsv1.ClinicController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Clinic

  def index(conn, _params) do
    clinics = Repo.all(Clinic)
    render(conn, "index.html", clinics: clinics)
  end

  def new(conn, _params) do
    changeset = Clinic.changeset(%Clinic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"clinic" => clinic_params}) do
    changeset = Clinic.changeset(%Clinic{}, clinic_params)

    case Repo.insert(changeset) do
      {:ok, _clinic} ->
        conn
        |> put_flash(:info, "Clinic created successfully.")
        |> redirect(to: clinic_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clinic = Repo.get!(Clinic, id)
    render(conn, "show.html", clinic: clinic)
  end

  def edit(conn, %{"id" => id}) do
    clinic = Repo.get!(Clinic, id)
    changeset = Clinic.changeset(clinic)
    render(conn, "edit.html", clinic: clinic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clinic" => clinic_params}) do
    clinic = Repo.get!(Clinic, id)
    changeset = Clinic.changeset(clinic, clinic_params)

    case Repo.update(changeset) do
      {:ok, clinic} ->
        conn
        |> put_flash(:info, "Clinic updated successfully.")
        |> redirect(to: clinic_path(conn, :show, clinic))
      {:error, changeset} ->
        render(conn, "edit.html", clinic: clinic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clinic = Repo.get!(Clinic, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(clinic)

    conn
    |> put_flash(:info, "Clinic deleted successfully.")
    |> redirect(to: clinic_path(conn, :index))
  end

  plug :authenticate when action in [:index, :show, :new, :edit, :update, :delete]

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
    conn
    else
    conn
    |> put_flash(:error, "You must be logged in to access that page")
    |> redirect(to: session_path(conn, :new))
    |> halt()
    end
    end
end
