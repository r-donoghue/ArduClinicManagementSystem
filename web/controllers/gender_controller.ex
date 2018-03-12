defmodule Cmsv1.GenderController do
  use Cmsv1.Web, :controller

  alias Cmsv1.Gender

  def index(conn, _params) do
    genders = Repo.all(Gender)
    render(conn, "index.html", genders: genders)
  end

  def new(conn, _params) do
    changeset = Gender.changeset(%Gender{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"gender" => gender_params}) do
    changeset = Gender.changeset(%Gender{}, gender_params)

    case Repo.insert(changeset) do
      {:ok, _gender} ->
        conn
        |> put_flash(:info, "Gender created successfully.")
        |> redirect(to: gender_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gender = Repo.get!(Gender, id)
    render(conn, "show.html", gender: gender)
  end

  def edit(conn, %{"id" => id}) do
    gender = Repo.get!(Gender, id)
    changeset = Gender.changeset(gender)
    render(conn, "edit.html", gender: gender, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gender" => gender_params}) do
    gender = Repo.get!(Gender, id)
    changeset = Gender.changeset(gender, gender_params)

    case Repo.update(changeset) do
      {:ok, gender} ->
        conn
        |> put_flash(:info, "Gender updated successfully.")
        |> redirect(to: gender_path(conn, :show, gender))
      {:error, changeset} ->
        render(conn, "edit.html", gender: gender, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gender = Repo.get!(Gender, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(gender)

    conn
    |> put_flash(:info, "Gender deleted successfully.")
    |> redirect(to: gender_path(conn, :index))
  end
end
