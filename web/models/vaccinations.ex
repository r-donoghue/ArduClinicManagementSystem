defmodule Cmsv1.Vaccinations do
  use Cmsv1.Web, :model

  schema "vaccs" do
    field :patient_id, :string
    field :vacc_brand, :string
    field :dose1_status, :string
    field :dose1_date, :string
    field :dose2_status, :string
    field :dose2_date, :string
    field :dose3_status, :string
    field :dose3_date, :string
    field :hbs_status, :string
    field :hbs_result, :string
    field :revacc_status, :string
    field :revacc_type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:patient_id, :vacc_brand, :dose1_status, :dose1_date, :dose2_status, :dose2_date, :dose3_status, :dose3_date, :hbs_status, :hbs_result, :revacc_status, :revacc_type])
    |> validate_required([:patient_id, :vacc_brand, :dose1_status, :dose1_date, :dose2_status, :dose2_date, :dose3_status, :dose3_date, :hbs_status, :hbs_result, :revacc_status, :revacc_type])
  end
end
