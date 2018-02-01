defmodule Cmsv1.PharmacyTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Pharmacy

  @valid_attrs %{address: "some content", email: "some content", fax: "some content", landline_number: "some content", mobile_number: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pharmacy.changeset(%Pharmacy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pharmacy.changeset(%Pharmacy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
