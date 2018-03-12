defmodule Cmsv1.RelationshipTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Relationship

  @valid_attrs %{relationship: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Relationship.changeset(%Relationship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Relationship.changeset(%Relationship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
