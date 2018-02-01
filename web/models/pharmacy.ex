defmodule Cmsv1.Pharmacy do
  use Cmsv1.Web, :model

  @primary_key {:pharm_id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :pharm_id}

  schema "pharms" do
    field :name, :string
    field :address, :string
    field :mobile_number, :string
    field :landline_number, :string
    field :fax, :string
    field :email, :string
    has_many :patients, Cmsv1.Patient

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address, :mobile_number, :landline_number, :fax, :email])
    |> validate_required([:name, :address, :mobile_number, :landline_number, :fax, :email])
  end
end
