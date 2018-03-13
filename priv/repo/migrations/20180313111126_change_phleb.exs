defmodule Cmsv1.Repo.Migrations.ChangePhleb do
  use Ecto.Migration

  def change do
    alter table(:phleb) do
      remove :hiv_status
      remove :hiv_date
      remove :hepc_status
      remove :hepc_date
      remove :hepa_status
      remove :hepa_date
      remove :hepb_status
      remove :hepb_date
      remove :ref_status
      remove :ref_date
      
      add :hiv_status, :boolean, default: false, null: false
      add :hiv_date, :date
      add :hepc_status, :boolean, default: false, null: false
      add :hepc_date, :date
      add :hepa_status, :boolean, default: false, null: false
      add :hepa_date, :date
      add :hepb_status, :boolean, default: false, null: false
      add :hepb_date, :date
      add :ref_status, :boolean, default: false, null: false
      add :ref_date, :date
    end
      

  end
end
