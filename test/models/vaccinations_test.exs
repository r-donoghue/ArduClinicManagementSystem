defmodule Cmsv1.VaccinationsTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Vaccinations

  @valid_attrs %{dose1_date: "some content", dose1_status: "some content", dose2_date: "some content", dose2_status: "some content", dose3_date: "some content", dose3_status: "some content", hbs_result: "some content", hbs_status: "some content", patient_id: "some content", revacc_status: "some content", revacc_type: "some content", vacc_brand: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vaccinations.changeset(%Vaccinations{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vaccinations.changeset(%Vaccinations{}, @invalid_attrs)
    refute changeset.valid?
  end
end
