defmodule Cmsv1.PhlebotomyTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Phlebotomy

  @valid_attrs %{hepa_date: "some content", hepa_status: "some content", hepb_date: "some content", hepb_status: "some content", hepc_date: "some content", hepc_status: "some content", hiv_date: "some content", hiv_status: "some content", ref_date: "some content", ref_status: "some content", ref_to: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Phlebotomy.changeset(%Phlebotomy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Phlebotomy.changeset(%Phlebotomy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
