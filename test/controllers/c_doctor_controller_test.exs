defmodule Cmsv1.CDoctorControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.CDoctor
  @valid_attrs %{address: "some content", email: "some content", fax: "some content", landline_number: "some content", mobile_number: "some content", name: "some content", training_level: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, c_doctor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cdoctors"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, c_doctor_path(conn, :new)
    assert html_response(conn, 200) =~ "New c doctor"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, c_doctor_path(conn, :create), c_doctor: @valid_attrs
    assert redirected_to(conn) == c_doctor_path(conn, :index)
    assert Repo.get_by(CDoctor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, c_doctor_path(conn, :create), c_doctor: @invalid_attrs
    assert html_response(conn, 200) =~ "New c doctor"
  end

  test "shows chosen resource", %{conn: conn} do
    c_doctor = Repo.insert! %CDoctor{}
    conn = get conn, c_doctor_path(conn, :show, c_doctor)
    assert html_response(conn, 200) =~ "Show c doctor"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, c_doctor_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    c_doctor = Repo.insert! %CDoctor{}
    conn = get conn, c_doctor_path(conn, :edit, c_doctor)
    assert html_response(conn, 200) =~ "Edit c doctor"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    c_doctor = Repo.insert! %CDoctor{}
    conn = put conn, c_doctor_path(conn, :update, c_doctor), c_doctor: @valid_attrs
    assert redirected_to(conn) == c_doctor_path(conn, :show, c_doctor)
    assert Repo.get_by(CDoctor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    c_doctor = Repo.insert! %CDoctor{}
    conn = put conn, c_doctor_path(conn, :update, c_doctor), c_doctor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit c doctor"
  end

  test "deletes chosen resource", %{conn: conn} do
    c_doctor = Repo.insert! %CDoctor{}
    conn = delete conn, c_doctor_path(conn, :delete, c_doctor)
    assert redirected_to(conn) == c_doctor_path(conn, :index)
    refute Repo.get(CDoctor, c_doctor.id)
  end
end
