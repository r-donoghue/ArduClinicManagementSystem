defmodule Cmsv1.Repo.Migrations.CreatePhlebotomy do
  use Ecto.Migration

  def change do
    create table(:phleb, primary_key: false) do
      add :phleb_id, :uuid, primary_key: true
      add :hiv_status, :string
      add :hiv_date, :string
      add :hepc_status, :string
      add :hepc_date, :string
      add :hepa_status, :string
      add :hepa_date, :string
      add :hepb_status, :string
      add :hepb_date, :string
      add :ref_status, :string
      add :ref_date, :string
      add :ref_to, :string
      add :patient_id, references(:patients, column: :patient_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end

  end
end
