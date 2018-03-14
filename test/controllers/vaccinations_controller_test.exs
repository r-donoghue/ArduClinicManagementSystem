defmodule Cmsv1.VaccinationsControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Vaccinations
  @valid_attrs %{dose1_date: "some content", dose1_status: "some content", dose2_date: "some content", dose2_status: "some content", dose3_date: "some content", dose3_status: "some content", hbs_result: "some content", hbs_status: "some content", patient_id: "some content", revacc_status: "some content", revacc_type: "some content", vacc_brand: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, vaccinations_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing vaccs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, vaccinations_path(conn, :new)
    assert html_response(conn, 200) =~ "New vaccinations"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, vaccinations_path(conn, :create), vaccinations: @valid_attrs
    assert redirected_to(conn) == vaccinations_path(conn, :index)
    assert Repo.get_by(Vaccinations, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, vaccinations_path(conn, :create), vaccinations: @invalid_attrs
    assert html_response(conn, 200) =~ "New vaccinations"
  end

  test "shows chosen resource", %{conn: conn} do
    vaccinations = Repo.insert! %Vaccinations{}
    conn = get conn, vaccinations_path(conn, :show, vaccinations)
    assert html_response(conn, 200) =~ "Show vaccinations"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, vaccinations_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    vaccinations = Repo.insert! %Vaccinations{}
    conn = get conn, vaccinations_path(conn, :edit, vaccinations)
    assert html_response(conn, 200) =~ "Edit vaccinations"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    vaccinations = Repo.insert! %Vaccinations{}
    conn = put conn, vaccinations_path(conn, :update, vaccinations), vaccinations: @valid_attrs
    assert redirected_to(conn) == vaccinations_path(conn, :show, vaccinations)
    assert Repo.get_by(Vaccinations, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    vaccinations = Repo.insert! %Vaccinations{}
    conn = put conn, vaccinations_path(conn, :update, vaccinations), vaccinations: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit vaccinations"
  end

  test "deletes chosen resource", %{conn: conn} do
    vaccinations = Repo.insert! %Vaccinations{}
    conn = delete conn, vaccinations_path(conn, :delete, vaccinations)
    assert redirected_to(conn) == vaccinations_path(conn, :index)
    refute Repo.get(Vaccinations, vaccinations.id)
  end
end
