defmodule Cmsv1.InactivityController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Inactivity

  def index(conn, _params) do
    reasons = Repo.all(Inactivity)
    render(conn, "index.html", reasons: reasons)
  end

  def new(conn, _params) do
    changeset = Inactivity.changeset(%Inactivity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inactivity" => inactivity_params}) do
    changeset = Inactivity.changeset(%Inactivity{}, inactivity_params)

    case Repo.insert(changeset) do
      {:ok, _inactivity} ->
        conn
        |> put_flash(:info, "Inactivity created successfully.")
        |> redirect(to: inactivity_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inactivity = Repo.get!(Inactivity, id)
    render(conn, "show.html", inactivity: inactivity)
  end

  def edit(conn, %{"id" => id}) do
    inactivity = Repo.get!(Inactivity, id)
    changeset = Inactivity.changeset(inactivity)
    render(conn, "edit.html", inactivity: inactivity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inactivity" => inactivity_params}) do
    inactivity = Repo.get!(Inactivity, id)
    changeset = Inactivity.changeset(inactivity, inactivity_params)

    case Repo.update(changeset) do
      {:ok, inactivity} ->
        conn
        |> put_flash(:info, "Inactivity updated successfully.")
        |> redirect(to: inactivity_path(conn, :show, inactivity))
      {:error, changeset} ->
        render(conn, "edit.html", inactivity: inactivity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inactivity = Repo.get!(Inactivity, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(inactivity)

    conn
    |> put_flash(:info, "Inactivity deleted successfully.")
    |> redirect(to: inactivity_path(conn, :index))
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
