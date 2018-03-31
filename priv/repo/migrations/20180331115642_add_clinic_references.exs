defmodule Cmsv1.Repo.Migrations.AddClinicReferences do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :clinic_id, references(:clinics, column: :clinic_id, type: :uuid, on_delete: :nothing)
    end
    alter table(:vaccs) do
      add :clinic_id, references(:clinics, column: :clinic_id, type: :uuid, on_delete: :nothing)
    end
    alter table(:phleb) do
      add :clinic_id, references(:clinics, column: :clinic_id, type: :uuid, on_delete: :nothing)
    end
  end
end
