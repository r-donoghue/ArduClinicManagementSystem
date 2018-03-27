defmodule Cmsv1.Repo.Migrations.RemoveAddFieldPatients do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :transfer_status
      add :transfer_status, :boolean, default: false
    end
  end
end
