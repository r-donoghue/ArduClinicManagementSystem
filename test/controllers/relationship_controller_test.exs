defmodule Cmsv1.RelationshipControllerTest do
  use Cmsv1.ConnCase

  alias Cmsv1.Relationship
  @valid_attrs %{relationship: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, relationship_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing relationships"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, relationship_path(conn, :new)
    assert html_response(conn, 200) =~ "New relationship"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, relationship_path(conn, :create), relationship: @valid_attrs
    assert redirected_to(conn) == relationship_path(conn, :index)
    assert Repo.get_by(Relationship, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, relationship_path(conn, :create), relationship: @invalid_attrs
    assert html_response(conn, 200) =~ "New relationship"
  end

  test "shows chosen resource", %{conn: conn} do
    relationship = Repo.insert! %Relationship{}
    conn = get conn, relationship_path(conn, :show, relationship)
    assert html_response(conn, 200) =~ "Show relationship"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, relationship_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    relationship = Repo.insert! %Relationship{}
    conn = get conn, relationship_path(conn, :edit, relationship)
    assert html_response(conn, 200) =~ "Edit relationship"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    relationship = Repo.insert! %Relationship{}
    conn = put conn, relationship_path(conn, :update, relationship), relationship: @valid_attrs
    assert redirected_to(conn) == relationship_path(conn, :show, relationship)
    assert Repo.get_by(Relationship, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    relationship = Repo.insert! %Relationship{}
    conn = put conn, relationship_path(conn, :update, relationship), relationship: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit relationship"
  end

  test "deletes chosen resource", %{conn: conn} do
    relationship = Repo.insert! %Relationship{}
    conn = delete conn, relationship_path(conn, :delete, relationship)
    assert redirected_to(conn) == relationship_path(conn, :index)
    refute Repo.get(Relationship, relationship.id)
  end
end
