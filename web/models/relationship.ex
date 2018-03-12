defmodule Cmsv1.Relationship do
  use Cmsv1.Web, :model

  schema "relationships" do
    field :relationship, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:relationship])
    |> validate_required([:relationship])
  end
end
