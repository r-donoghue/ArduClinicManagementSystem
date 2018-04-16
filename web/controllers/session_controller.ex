defmodule Cmsv1.SessionController do
    use Cmsv1.Web, :controller

    alias Cmsv1.Repo 
    def new(conn, _) do
        render conn, "new.html"
    end

    def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
        case Cmsv1.Auth.login_by_username_and_pass(conn, user, pass, repo: Repo) do
            
            {:ok, conn} ->
                user = get_session(conn, :level)
                if user == "admin" do
                    IO.inspect("IS ADMIN")
                    conn
                    |> put_flash(:info, "Welcome back!")
                    |> redirect(to: user_path(conn, :index))
                else
                    IO.inspect("IS STANDARD")
                    conn
                    |> put_flash(:info, "Welcome back!")
                    |> redirect(to: patient_path(conn, :index))
                end
                
            {:error, _reason, conn} ->
                conn
                |> put_flash(:error, "Invalid username/password combination")
                |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> Cmsv1.Auth.logout()
        |> redirect(to: session_path(conn, :new))
        end
end