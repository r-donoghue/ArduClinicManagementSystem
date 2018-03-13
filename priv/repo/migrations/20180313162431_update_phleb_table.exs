defmodule Cmsv1.Repo.Migrations.UpdatePhlebTable do
  use Ecto.Migration

  def change do
    create index(:phleb, [:patient_id])
  end
end
