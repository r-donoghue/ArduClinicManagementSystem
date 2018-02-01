defmodule Cmsv1.GPControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.GP
  @valid_attrs %{address: "some content", email: "some content", fax: "some content", landline_number: "some content", mobile_number: "some content", name: "some content", training_level: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gp_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing gps"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gp_path(conn, :new)
    assert html_response(conn, 200) =~ "New gp"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gp_path(conn, :create), gp: @valid_attrs
    assert redirected_to(conn) == gp_path(conn, :index)
    assert Repo.get_by(GP, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gp_path(conn, :create), gp: @invalid_attrs
    assert html_response(conn, 200) =~ "New gp"
  end

  test "shows chosen resource", %{conn: conn} do
    gp = Repo.insert! %GP{}
    conn = get conn, gp_path(conn, :show, gp)
    assert html_response(conn, 200) =~ "Show gp"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, gp_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gp = Repo.insert! %GP{}
    conn = get conn, gp_path(conn, :edit, gp)
    assert html_response(conn, 200) =~ "Edit gp"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gp = Repo.insert! %GP{}
    conn = put conn, gp_path(conn, :update, gp), gp: @valid_attrs
    assert redirected_to(conn) == gp_path(conn, :show, gp)
    assert Repo.get_by(GP, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gp = Repo.insert! %GP{}
    conn = put conn, gp_path(conn, :update, gp), gp: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gp"
  end

  test "deletes chosen resource", %{conn: conn} do
    gp = Repo.insert! %GP{}
    conn = delete conn, gp_path(conn, :delete, gp)
    assert redirected_to(conn) == gp_path(conn, :index)
    refute Repo.get(GP, gp.id)
  end
end
