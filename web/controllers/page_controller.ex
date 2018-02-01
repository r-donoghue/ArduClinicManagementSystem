defmodule Cmsv1.PageController do
  use Cmsv1.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
