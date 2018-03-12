defmodule Cmsv1.RelationshipController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Relationship

  def index(conn, _params) do
    relationships = Repo.all(Relationship)
    render(conn, "index.html", relationships: relationships)
  end

  def new(conn, _params) do
    changeset = Relationship.changeset(%Relationship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"relationship" => relationship_params}) do
    changeset = Relationship.changeset(%Relationship{}, relationship_params)

    case Repo.insert(changeset) do
      {:ok, _relationship} ->
        conn
        |> put_flash(:info, "Relationship created successfully.")
        |> redirect(to: relationship_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    relationship = Repo.get!(Relationship, id)
    render(conn, "show.html", relationship: relationship)
  end

  def edit(conn, %{"id" => id}) do
    relationship = Repo.get!(Relationship, id)
    changeset = Relationship.changeset(relationship)
    render(conn, "edit.html", relationship: relationship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "relationship" => relationship_params}) do
    relationship = Repo.get!(Relationship, id)
    changeset = Relationship.changeset(relationship, relationship_params)

    case Repo.update(changeset) do
      {:ok, relationship} ->
        conn
        |> put_flash(:info, "Relationship updated successfully.")
        |> redirect(to: relationship_path(conn, :show, relationship))
      {:error, changeset} ->
        render(conn, "edit.html", relationship: relationship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    relationship = Repo.get!(Relationship, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(relationship)

    conn
    |> put_flash(:info, "Relationship deleted successfully.")
    |> redirect(to: relationship_path(conn, :index))
  end
end
