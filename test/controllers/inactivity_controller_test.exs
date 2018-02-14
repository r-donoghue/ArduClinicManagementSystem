defmodule Cmsv1.InactivityControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Inactivity
  @valid_attrs %{reason: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, inactivity_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing reasons"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, inactivity_path(conn, :new)
    assert html_response(conn, 200) =~ "New inactivity"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, inactivity_path(conn, :create), inactivity: @valid_attrs
    assert redirected_to(conn) == inactivity_path(conn, :index)
    assert Repo.get_by(Inactivity, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, inactivity_path(conn, :create), inactivity: @invalid_attrs
    assert html_response(conn, 200) =~ "New inactivity"
  end

  test "shows chosen resource", %{conn: conn} do
    inactivity = Repo.insert! %Inactivity{}
    conn = get conn, inactivity_path(conn, :show, inactivity)
    assert html_response(conn, 200) =~ "Show inactivity"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, inactivity_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    inactivity = Repo.insert! %Inactivity{}
    conn = get conn, inactivity_path(conn, :edit, inactivity)
    assert html_response(conn, 200) =~ "Edit inactivity"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    inactivity = Repo.insert! %Inactivity{}
    conn = put conn, inactivity_path(conn, :update, inactivity), inactivity: @valid_attrs
    assert redirected_to(conn) == inactivity_path(conn, :show, inactivity)
    assert Repo.get_by(Inactivity, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    inactivity = Repo.insert! %Inactivity{}
    conn = put conn, inactivity_path(conn, :update, inactivity), inactivity: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit inactivity"
  end

  test "deletes chosen resource", %{conn: conn} do
    inactivity = Repo.insert! %Inactivity{}
    conn = delete conn, inactivity_path(conn, :delete, inactivity)
    assert redirected_to(conn) == inactivity_path(conn, :index)
    refute Repo.get(Inactivity, inactivity.id)
  end
end
