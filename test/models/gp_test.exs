defmodule Cmsv1.GPTest do
  use Cmsv1.ModelCase

  alias Cmsv1.GP

  @valid_attrs %{address: "some content", email: "some content", fax: "some content", landline_number: "some content", mobile_number: "some content", name: "some content", training_level: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GP.changeset(%GP{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GP.changeset(%GP{}, @invalid_attrs)
    refute changeset.valid?
  end
end
