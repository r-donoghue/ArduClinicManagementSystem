defmodule Cmsv1.CDoctorController do
  use Cmsv1.Web, :controller

  alias Cmsv1.CDoctor

  def index(conn, _params) do
    cdoctors = Repo.all(CDoctor)
    render(conn, "index.html", cdoctors: cdoctors)
  end

  def new(conn, _params) do
    changeset = CDoctor.changeset(%CDoctor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"c_doctor" => c_doctor_params}) do
    changeset = CDoctor.changeset(%CDoctor{}, c_doctor_params)

    case Repo.insert(changeset) do
      {:ok, _c_doctor} ->
        conn
        |> put_flash(:info, "C doctor created successfully.")
        |> redirect(to: c_doctor_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    c_doctor = Repo.get!(CDoctor, id)
    render(conn, "show.html", c_doctor: c_doctor)
  end

  def edit(conn, %{"id" => id}) do
    c_doctor = Repo.get!(CDoctor, id)
    changeset = CDoctor.changeset(c_doctor)
    render(conn, "edit.html", c_doctor: c_doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "c_doctor" => c_doctor_params}) do
    c_doctor = Repo.get!(CDoctor, id)
    changeset = CDoctor.changeset(c_doctor, c_doctor_params)

    case Repo.update(changeset) do
      {:ok, c_doctor} ->
        conn
        |> put_flash(:info, "C doctor updated successfully.")
        |> redirect(to: c_doctor_path(conn, :show, c_doctor))
      {:error, changeset} ->
        render(conn, "edit.html", c_doctor: c_doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    c_doctor = Repo.get!(CDoctor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(c_doctor)

    conn
    |> put_flash(:info, "C doctor deleted successfully.")
    |> redirect(to: c_doctor_path(conn, :index))
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
