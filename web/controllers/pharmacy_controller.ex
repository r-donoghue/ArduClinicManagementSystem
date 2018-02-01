defmodule Cmsv1.PharmacyController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Pharmacy

  def index(conn, _params) do
    pharms = Repo.all(Pharmacy)
    render(conn, "index.html", pharms: pharms)
  end

  def new(conn, _params) do
    changeset = Pharmacy.changeset(%Pharmacy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pharmacy" => pharmacy_params}) do
    changeset = Pharmacy.changeset(%Pharmacy{}, pharmacy_params)

    case Repo.insert(changeset) do
      {:ok, _pharmacy} ->
        conn
        |> put_flash(:info, "Pharmacy created successfully.")
        |> redirect(to: pharmacy_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pharmacy = Repo.get!(Pharmacy, id)
    render(conn, "show.html", pharmacy: pharmacy)
  end

  def edit(conn, %{"id" => id}) do
    pharmacy = Repo.get!(Pharmacy, id)
    changeset = Pharmacy.changeset(pharmacy)
    render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pharmacy" => pharmacy_params}) do
    pharmacy = Repo.get!(Pharmacy, id)
    changeset = Pharmacy.changeset(pharmacy, pharmacy_params)

    case Repo.update(changeset) do
      {:ok, pharmacy} ->
        conn
        |> put_flash(:info, "Pharmacy updated successfully.")
        |> redirect(to: pharmacy_path(conn, :show, pharmacy))
      {:error, changeset} ->
        render(conn, "edit.html", pharmacy: pharmacy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pharmacy = Repo.get!(Pharmacy, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(pharmacy)

    conn
    |> put_flash(:info, "Pharmacy deleted successfully.")
    |> redirect(to: pharmacy_path(conn, :index))
  end
end
