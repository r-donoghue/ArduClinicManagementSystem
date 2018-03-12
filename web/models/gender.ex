defmodule Cmsv1.Gender do
  use Cmsv1.Web, :model

  schema "genders" do
    field :gender, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:gender])
    |> validate_required([:gender])
  end
end
