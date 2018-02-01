defmodule Cmsv1.PatientTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Patient

  @valid_attrs %{active: true, active_details: "some content", address: "some content", date_of_birth: %{day: 17, month: 4, year: 2010}, gender: "some content", landline_number: "some content", medical_card_expiry: %{day: 17, month: 4, year: 2010}, medical_card_number: "some content", medical_card_present: true, mobile_number: "some content", name: "some content", nok_address: "some content", nok_landline_number: "some content", nok_mobile_number: "some content", nok_name: "some content", ph_number: 42, ppsn: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Patient.changeset(%Patient{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Patient.changeset(%Patient{}, @invalid_attrs)
    refute changeset.valid?
  end
end
