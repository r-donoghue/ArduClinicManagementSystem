defmodule Cmsv1.Repo.Migrations.AddToPatient do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :transfer_status, :string
    end
  end
end
