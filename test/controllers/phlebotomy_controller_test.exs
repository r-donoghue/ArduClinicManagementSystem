defmodule Cmsv1.PhlebotomyControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Phlebotomy
  @valid_attrs %{hepa_date: "some content", hepa_status: "some content", hepb_date: "some content", hepb_status: "some content", hepc_date: "some content", hepc_status: "some content", hiv_date: "some content", hiv_status: "some content", ref_date: "some content", ref_status: "some content", ref_to: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, phlebotomy_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing phleb"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, phlebotomy_path(conn, :new)
    assert html_response(conn, 200) =~ "New phlebotomy"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, phlebotomy_path(conn, :create), phlebotomy: @valid_attrs
    assert redirected_to(conn) == phlebotomy_path(conn, :index)
    assert Repo.get_by(Phlebotomy, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, phlebotomy_path(conn, :create), phlebotomy: @invalid_attrs
    assert html_response(conn, 200) =~ "New phlebotomy"
  end

  test "shows chosen resource", %{conn: conn} do
    phlebotomy = Repo.insert! %Phlebotomy{}
    conn = get conn, phlebotomy_path(conn, :show, phlebotomy)
    assert html_response(conn, 200) =~ "Show phlebotomy"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, phlebotomy_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    phlebotomy = Repo.insert! %Phlebotomy{}
    conn = get conn, phlebotomy_path(conn, :edit, phlebotomy)
    assert html_response(conn, 200) =~ "Edit phlebotomy"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    phlebotomy = Repo.insert! %Phlebotomy{}
    conn = put conn, phlebotomy_path(conn, :update, phlebotomy), phlebotomy: @valid_attrs
    assert redirected_to(conn) == phlebotomy_path(conn, :show, phlebotomy)
    assert Repo.get_by(Phlebotomy, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    phlebotomy = Repo.insert! %Phlebotomy{}
    conn = put conn, phlebotomy_path(conn, :update, phlebotomy), phlebotomy: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit phlebotomy"
  end

  test "deletes chosen resource", %{conn: conn} do
    phlebotomy = Repo.insert! %Phlebotomy{}
    conn = delete conn, phlebotomy_path(conn, :delete, phlebotomy)
    assert redirected_to(conn) == phlebotomy_path(conn, :index)
    refute Repo.get(Phlebotomy, phlebotomy.id)
  end
end
