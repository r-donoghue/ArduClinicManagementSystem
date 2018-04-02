defmodule Cmsv1.Repo.Migrations.UpdateUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :clinic_id, references(:clinics, column: :clinic_id, type: :uuid, on_delete: :nothing)
      add :level, :string
    end
  end
end
