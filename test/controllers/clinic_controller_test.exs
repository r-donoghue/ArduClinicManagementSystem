defmodule Cmsv1.ClinicControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Clinic
  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, clinic_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing clinics"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, clinic_path(conn, :new)
    assert html_response(conn, 200) =~ "New clinic"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @valid_attrs
    assert redirected_to(conn) == clinic_path(conn, :index)
    assert Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @invalid_attrs
    assert html_response(conn, 200) =~ "New clinic"
  end

  test "shows chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = get conn, clinic_path(conn, :show, clinic)
    assert html_response(conn, 200) =~ "Show clinic"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, clinic_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = get conn, clinic_path(conn, :edit, clinic)
    assert html_response(conn, 200) =~ "Edit clinic"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @valid_attrs
    assert redirected_to(conn) == clinic_path(conn, :show, clinic)
    assert Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit clinic"
  end

  test "deletes chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = delete conn, clinic_path(conn, :delete, clinic)
    assert redirected_to(conn) == clinic_path(conn, :index)
    refute Repo.get(Clinic, clinic.id)
  end
end
