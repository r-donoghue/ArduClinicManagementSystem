defmodule Cmsv1.Patient do
  use Cmsv1.Web, :model
  import Ecto.Changeset
  
  @primary_key {:patient_id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :patient_id}
  
  schema "patients" do
    field :ph_number, :binary
    field :fname, :binary
    field :lname, :binary
    field :street, :binary
    field :towncity, :binary
    field :county, :binary
    field :eircode, :binary
    field :ppsn, :binary
    field :date_of_birth, Ecto.Date
    field :gender, :string
    field :medical_card_present, :boolean, default: false
    field :medical_card_number, :binary
    field :medical_card_expiry, Ecto.Date
    field :mobile_number, :string
    field :landline_number, :string
    field :nok_rel, :binary
    field :nok_name, :string
    field :nok_address, :string
    field :nok_mobile_number, :string
    field :nok_landline_number, :string
    field :active, :boolean, default: false
    field :active_details, :string
    field :age, :integer
    belongs_to :gps, Cmsv1.GP, foreign_key: :gp_id, type: :binary_id, references: :gp_id
    belongs_to :cdoctors, Cmsv1.CDoctor, foreign_key: :cdoctor_id, type: :binary_id, references: :cdoctor_id
    belongs_to :pharms, Cmsv1.Pharmacy, foreign_key: :pharm_id, type: :binary_id, references: :pharm_id
    has_many :phleb, Cmsv1.Phlebotomy

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do

    struct
    |> cast(params, [:ph_number, :fname, :lname, :street, :towncity, :county, :eircode, :ppsn, :date_of_birth, :gender, :medical_card_present, :medical_card_number, :medical_card_expiry, :mobile_number, :landline_number, :nok_rel, :nok_name, :nok_address, :nok_mobile_number, :nok_landline_number, :active, :active_details, :cdoctor_id, :gp_id, :pharm_id])
    |> validate_required([:ph_number, :fname, :lname, :ppsn, :date_of_birth, :gender, :medical_card_present, :mobile_number, :landline_number, :nok_rel, :nok_name, :nok_address, :nok_mobile_number, :nok_landline_number, :active, :cdoctor_id, :gp_id, :pharm_id])
    |> foreign_key_constraint(:gp_id)
    |> foreign_key_constraint(:pharm_id)
    |> foreign_key_constraint(:cdoctor_id)
  end
end
