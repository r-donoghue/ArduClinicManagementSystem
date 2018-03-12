defmodule Cmsv1.GenderTest do
  use Cmsv1.ModelCase

  alias Cmsv1.Gender

  @valid_attrs %{gender: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Gender.changeset(%Gender{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Gender.changeset(%Gender{}, @invalid_attrs)
    refute changeset.valid?
  end
end
