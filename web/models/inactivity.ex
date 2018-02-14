defmodule Cmsv1.Inactivity do
  use Cmsv1.Web, :model

  schema "reasons" do
    field :reason, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:reason])
    |> validate_required([:reason])
  end
end
