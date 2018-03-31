defmodule Cmsv1.UserController do
    use Cmsv1.Web, :controller

    alias Cmsv1.User

    def index(conn, _params) do
        users = Repo.all(User)
        render conn, "index.html", users: users
    end
    def show(conn, %{"id" => id}) do
        user = Repo.get(User, id)
        render conn, "show.html", user: user
    end
end