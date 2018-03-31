defmodule Cmsv1.Clinic do
  use Cmsv1.Web, :model

  @primary_key {:clinic_id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :clinic_id}

  schema "clinics" do
    field :name, :string
    field :address, :string
    has_one :patients, Cmsv1.Patient
    has_one :vaccs, Cmsv1.Vaccination
    has_one :phleb, Cmsv1.Phlebotomy


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address])
    |> validate_required([:name, :address])
  end
end
