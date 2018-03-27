defmodule Cmsv1.GP do
  use Cmsv1.Web, :model

  @primary_key {:gp_id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :gp_id}

  schema "gps" do
    field :name, :string
    field :address, :string
    field :mobile_number, :string
    field :landline_number, :string
    field :fax, :string
    field :email, :string
    field :training_level, :string
    has_one :patients, Cmsv1.Patient

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address, :mobile_number, :landline_number, :fax, :email, :training_level])
    |> validate_required([:name, :address, :mobile_number, :landline_number, :fax, :email, :training_level])
  end
end
