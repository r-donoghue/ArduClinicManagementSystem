defmodule Cmsv1.Repo.Migrations.CreateVaccinations do
  use Ecto.Migration

  def change do
    create table(:vaccs, primary_key: false) do
      add :vacc_id, :uuid, primary_key: true
      add :vacc_brand, :string
      add :dose1_status, :boolean, default: false, null: false
      add :dose1_date, :date
      add :dose2_status, :boolean, default: false, null: false
      add :dose2_date, :date
      add :dose3_status, :boolean, default: false, null: false
      add :dose3_date, :date
      add :hbs_status, :boolean, default: false, null: false
      add :hbs_result, :date
      add :revacc_status, :boolean, default: false, null: false
      add :revacc_type, :date
      add :patient_id, references(:patients, column: :patient_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end
    create index(:vaccs, [:patient_id])
  end
end
