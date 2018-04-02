defmodule Cmsv1.UserController do
    use Cmsv1.Web, :controller

    #plug :authenticate when action in [:index, :show]

    alias Cmsv1.User
    alias Cmsv1.Clinic

    def index(conn, _params) do
        users = Repo.all(Cmsv1.User)
        render conn, "index.html", users: users
        end

    def show(conn, %{"id" => id}) do
        user = Repo.get(Cmsv1.User, id)
        render conn, "show.html", user: user
    end
    
    def new(conn, _params) do
        changeset = User.changeset(%User{})
        clinics = Repo.all(Clinic) |> Enum.map(&{&1.name, &1.clinic_id}) |> Enum.into(%{}) 
        render conn, "new.html", changeset: changeset, clinics: clinics
    end

    def create(conn, %{"user" => user_params}) do
        changeset = User.registration_changeset(%User{}, user_params)
        
        case Repo.insert(changeset) do
            {:ok, user} ->
                conn
                |> put_flash(:info, "#{user.name} created!")
                |> redirect(to: user_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

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