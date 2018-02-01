defmodule Cmsv1.PatientControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Patient
  @valid_attrs %{active: true, active_details: "some content", address: "some content", date_of_birth: %{day: 17, month: 4, year: 2010}, gender: "some content", landline_number: "some content", medical_card_expiry: %{day: 17, month: 4, year: 2010}, medical_card_number: "some content", medical_card_present: true, mobile_number: "some content", name: "some content", nok_address: "some content", nok_landline_number: "some content", nok_mobile_number: "some content", nok_name: "some content", ph_number: 42, ppsn: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, patient_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing patients"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, patient_path(conn, :new)
    assert html_response(conn, 200) =~ "New patient"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, patient_path(conn, :create), patient: @valid_attrs
    assert redirected_to(conn) == patient_path(conn, :index)
    assert Repo.get_by(Patient, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, patient_path(conn, :create), patient: @invalid_attrs
    assert html_response(conn, 200) =~ "New patient"
  end

  test "shows chosen resource", %{conn: conn} do
    patient = Repo.insert! %Patient{}
    conn = get conn, patient_path(conn, :show, patient)
    assert html_response(conn, 200) =~ "Show patient"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, patient_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    patient = Repo.insert! %Patient{}
    conn = get conn, patient_path(conn, :edit, patient)
    assert html_response(conn, 200) =~ "Edit patient"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    patient = Repo.insert! %Patient{}
    conn = put conn, patient_path(conn, :update, patient), patient: @valid_attrs
    assert redirected_to(conn) == patient_path(conn, :show, patient)
    assert Repo.get_by(Patient, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    patient = Repo.insert! %Patient{}
    conn = put conn, patient_path(conn, :update, patient), patient: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit patient"
  end

  test "deletes chosen resource", %{conn: conn} do
    patient = Repo.insert! %Patient{}
    conn = delete conn, patient_path(conn, :delete, patient)
    assert redirected_to(conn) == patient_path(conn, :index)
    refute Repo.get(Patient, patient.id)
  end
end
