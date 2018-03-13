defmodule Cmsv1.Phlebotomy do
  use Cmsv1.Web, :model

  @primary_key {:phleb_id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :phleb_id}

  schema "phleb" do
    field :hiv_status, :boolean, default: false
    field :hiv_date, Ecto.Date
    field :hepc_status, :boolean, default: false
    field :hepc_date, Ecto.Date
    field :hepa_status, :boolean, default: false
    field :hepa_date, Ecto.Date
    field :hepb_status, :boolean, default: false
    field :hepb_date, Ecto.Date
    field :ref_status, :boolean, default: false
    field :ref_date, Ecto.Date
    field :ref_to, :string
    belongs_to :patients, Cmsv1.Patient, foreign_key: :patient_id, type: :binary_id, references: :patient_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:patient_id, :hiv_status, :hiv_date, :hepc_status, :hepc_date, :hepa_status, :hepa_date, :hepb_status, :hepb_date, :ref_status, :ref_date, :ref_to])
    |> validate_required([:hiv_status, :hiv_date, :hepc_status, :hepc_date, :hepa_status, :hepa_date, :hepb_status, :hepb_date])
    |> foreign_key_constraint(:patient_id)
  end
end
