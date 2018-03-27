defmodule Cmsv1.VaccBrandControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.VaccBrand
  @valid_attrs %{vaccbrand: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, vacc_brand_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing vaccbrands"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, vacc_brand_path(conn, :new)
    assert html_response(conn, 200) =~ "New vacc brand"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, vacc_brand_path(conn, :create), vacc_brand: @valid_attrs
    assert redirected_to(conn) == vacc_brand_path(conn, :index)
    assert Repo.get_by(VaccBrand, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, vacc_brand_path(conn, :create), vacc_brand: @invalid_attrs
    assert html_response(conn, 200) =~ "New vacc brand"
  end

  test "shows chosen resource", %{conn: conn} do
    vacc_brand = Repo.insert! %VaccBrand{}
    conn = get conn, vacc_brand_path(conn, :show, vacc_brand)
    assert html_response(conn, 200) =~ "Show vacc brand"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, vacc_brand_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    vacc_brand = Repo.insert! %VaccBrand{}
    conn = get conn, vacc_brand_path(conn, :edit, vacc_brand)
    assert html_response(conn, 200) =~ "Edit vacc brand"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    vacc_brand = Repo.insert! %VaccBrand{}
    conn = put conn, vacc_brand_path(conn, :update, vacc_brand), vacc_brand: @valid_attrs
    assert redirected_to(conn) == vacc_brand_path(conn, :show, vacc_brand)
    assert Repo.get_by(VaccBrand, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    vacc_brand = Repo.insert! %VaccBrand{}
    conn = put conn, vacc_brand_path(conn, :update, vacc_brand), vacc_brand: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit vacc brand"
  end

  test "deletes chosen resource", %{conn: conn} do
    vacc_brand = Repo.insert! %VaccBrand{}
    conn = delete conn, vacc_brand_path(conn, :delete, vacc_brand)
    assert redirected_to(conn) == vacc_brand_path(conn, :index)
    refute Repo.get(VaccBrand, vacc_brand.id)
  end
end
