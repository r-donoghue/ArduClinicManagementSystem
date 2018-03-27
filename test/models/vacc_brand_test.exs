defmodule Cmsv1.VaccBrandTest do
  use Cmsv1.ModelCase

  alias Cmsv1.VaccBrand

  @valid_attrs %{vaccbrand: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VaccBrand.changeset(%VaccBrand{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VaccBrand.changeset(%VaccBrand{}, @invalid_attrs)
    refute changeset.valid?
  end
end
