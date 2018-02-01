defmodule Cmsv1.GPController do
  use Cmsv1.Web, :controller

  alias Cmsv1.GP

  def index(conn, _params) do
    gps = Repo.all(GP)
    render(conn, "index.html", gps: gps)
  end

  def new(conn, _params) do
    changeset = GP.changeset(%GP{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gp" => gp_params}) do
    changeset = GP.changeset(%GP{}, gp_params)

    case Repo.insert(changeset) do
      {:ok, _gp} ->
        conn
        |> put_flash(:info, "Gp created successfully.")
        |> redirect(to: gp_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gp = Repo.get!(GP, id)
    render(conn, "show.html", gp: gp)
  end

  def edit(conn, %{"id" => id}) do
    gp = Repo.get!(GP, id)
    changeset = GP.changeset(gp)
    render(conn, "edit.html", gp: gp, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gp" => gp_params}) do
    gp = Repo.get!(GP, id)
    changeset = GP.changeset(gp, gp_params)

    case Repo.update(changeset) do
      {:ok, gp} ->
        conn
        |> put_flash(:info, "Gp updated successfully.")
        |> redirect(to: gp_path(conn, :show, gp))
      {:error, changeset} ->
        render(conn, "edit.html", gp: gp, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gp = Repo.get!(GP, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gp)

    conn
    |> put_flash(:info, "Gp deleted successfully.")
    |> redirect(to: gp_path(conn, :index))
  end
end
