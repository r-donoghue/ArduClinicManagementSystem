defmodule Cmsv1.VaccBrand do
  use Cmsv1.Web, :model

  schema "vaccbrands" do
    field :vaccbrand, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:vaccbrand])
    |> validate_required([:vaccbrand])
  end
end
