defmodule Cmsv1.SessionController do
    use Cmsv1.Web, :controller

    alias Cmsv1.Repo 
    def new(conn, _) do
        render conn, "new.html"
    end

    def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
        case Cmsv1.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
            {:ok, conn} ->
                conn
                |> put_flash(:info, "Welcome back!")
                |> redirect(to: patient_path(conn, :index))
            {:error, _reason, conn} ->
                conn
                |> put_flash(:error, "Invalid username/password combination")
                |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> Cmsv1.Auth.logout()
        |> redirect(to: page_path(conn, :index))
        end
end