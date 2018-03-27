defmodule Cmsv1.VaccBrandController do
  use Cmsv1.Web, :controller

  alias Cmsv1.VaccBrand

  def index(conn, _params) do
    vaccbrands = Repo.all(VaccBrand)
    render(conn, "index.html", vaccbrands: vaccbrands)
  end

  def new(conn, _params) do
    changeset = VaccBrand.changeset(%VaccBrand{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vacc_brand" => vacc_brand_params}) do
    changeset = VaccBrand.changeset(%VaccBrand{}, vacc_brand_params)

    case Repo.insert(changeset) do
      {:ok, _vacc_brand} ->
        conn
        |> put_flash(:info, "Vacc brand created successfully.")
        |> redirect(to: vacc_brand_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vacc_brand = Repo.get!(VaccBrand, id)
    render(conn, "show.html", vacc_brand: vacc_brand)
  end

  def edit(conn, %{"id" => id}) do
    vacc_brand = Repo.get!(VaccBrand, id)
    changeset = VaccBrand.changeset(vacc_brand)
    render(conn, "edit.html", vacc_brand: vacc_brand, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vacc_brand" => vacc_brand_params}) do
    vacc_brand = Repo.get!(VaccBrand, id)
    changeset = VaccBrand.changeset(vacc_brand, vacc_brand_params)

    case Repo.update(changeset) do
      {:ok, vacc_brand} ->
        conn
        |> put_flash(:info, "Vacc brand updated successfully.")
        |> redirect(to: vacc_brand_path(conn, :show, vacc_brand))
      {:error, changeset} ->
        render(conn, "edit.html", vacc_brand: vacc_brand, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vacc_brand = Repo.get!(VaccBrand, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vacc_brand)

    conn
    |> put_flash(:info, "Vacc brand deleted successfully.")
    |> redirect(to: vacc_brand_path(conn, :index))
  end
end
