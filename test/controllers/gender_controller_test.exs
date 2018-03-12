defmodule Cmsv1.GenderControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Gender
  @valid_attrs %{gender: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, gender_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing genders"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, gender_path(conn, :new)
    assert html_response(conn, 200) =~ "New gender"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, gender_path(conn, :create), gender: @valid_attrs
    assert redirected_to(conn) == gender_path(conn, :index)
    assert Repo.get_by(Gender, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, gender_path(conn, :create), gender: @invalid_attrs
    assert html_response(conn, 200) =~ "New gender"
  end

  test "shows chosen resource", %{conn: conn} do
    gender = Repo.insert! %Gender{}
    conn = get conn, gender_path(conn, :show, gender)
    assert html_response(conn, 200) =~ "Show gender"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, gender_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    gender = Repo.insert! %Gender{}
    conn = get conn, gender_path(conn, :edit, gender)
    assert html_response(conn, 200) =~ "Edit gender"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    gender = Repo.insert! %Gender{}
    conn = put conn, gender_path(conn, :update, gender), gender: @valid_attrs
    assert redirected_to(conn) == gender_path(conn, :show, gender)
    assert Repo.get_by(Gender, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    gender = Repo.insert! %Gender{}
    conn = put conn, gender_path(conn, :update, gender), gender: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit gender"
  end

  test "deletes chosen resource", %{conn: conn} do
    gender = Repo.insert! %Gender{}
    conn = delete conn, gender_path(conn, :delete, gender)
    assert redirected_to(conn) == gender_path(conn, :index)
    refute Repo.get(Gender, gender.id)
  end
end
