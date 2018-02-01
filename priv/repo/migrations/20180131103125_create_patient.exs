defmodule Cmsv1.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  def change do
    create table(:patients, primary_key: false) do
      add :patient_id, :uuid, primary_key: true
      add :ph_number, :integer
      add :name, :binary
      add :address, :binary
      add :ppsn, :binary
      add :date_of_birth, :date
      add :gender, :string
      add :medical_card_present, :boolean, default: false, null: false
      add :medical_card_number, :binary
      add :medical_card_expiry, :date
      add :mobile_number, :string
      add :landline_number, :string
      add :nok_name, :string
      add :nok_address, :string
      add :nok_mobile_number, :string
      add :nok_landline_number, :string
      add :active, :boolean, default: false, null: false
      add :active_details, :string
      add :gp_id, references(:gps, column: :gp_id, type: :uuid, on_delete: :nothing)
      add :cdoctor_id, references(:cdoctors, column: :cdoctor_id, type: :uuid, on_delete: :nothing)
      add :pharm_id, references(:pharms, column: :pharm_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end
    create index(:patients, [:gp_id])
    create index(:patients, [:cdoctor_id])
    create index(:patients, [:pharm_id])

  end
end
