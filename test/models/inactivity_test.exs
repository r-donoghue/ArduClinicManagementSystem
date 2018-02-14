defmodule Cmsv1.InactivityTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Inactivity

  @valid_attrs %{reason: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Inactivity.changeset(%Inactivity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Inactivity.changeset(%Inactivity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
