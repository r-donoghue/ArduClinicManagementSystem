defmodule Cmsv1.PharmacyControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Pharmacy
  @valid_attrs %{address: "some content", email: "some content", fax: "some content", landline_number: "some content", mobile_number: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pharmacy_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pharms"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pharmacy_path(conn, :new)
    assert html_response(conn, 200) =~ "New pharmacy"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pharmacy_path(conn, :create), pharmacy: @valid_attrs
    assert redirected_to(conn) == pharmacy_path(conn, :index)
    assert Repo.get_by(Pharmacy, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pharmacy_path(conn, :create), pharmacy: @invalid_attrs
    assert html_response(conn, 200) =~ "New pharmacy"
  end

  test "shows chosen resource", %{conn: conn} do
    pharmacy = Repo.insert! %Pharmacy{}
    conn = get conn, pharmacy_path(conn, :show, pharmacy)
    assert html_response(conn, 200) =~ "Show pharmacy"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pharmacy_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pharmacy = Repo.insert! %Pharmacy{}
    conn = get conn, pharmacy_path(conn, :edit, pharmacy)
    assert html_response(conn, 200) =~ "Edit pharmacy"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pharmacy = Repo.insert! %Pharmacy{}
    conn = put conn, pharmacy_path(conn, :update, pharmacy), pharmacy: @valid_attrs
    assert redirected_to(conn) == pharmacy_path(conn, :show, pharmacy)
    assert Repo.get_by(Pharmacy, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pharmacy = Repo.insert! %Pharmacy{}
    conn = put conn, pharmacy_path(conn, :update, pharmacy), pharmacy: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pharmacy"
  end

  test "deletes chosen resource", %{conn: conn} do
    pharmacy = Repo.insert! %Pharmacy{}
    conn = delete conn, pharmacy_path(conn, :delete, pharmacy)
    assert redirected_to(conn) == pharmacy_path(conn, :index)
    refute Repo.get(Pharmacy, pharmacy.id)
  end
end
