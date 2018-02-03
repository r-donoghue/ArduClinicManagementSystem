defmodule Cmsv1.Repo.Migrations.AddFieldToPatient do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :age, :integer
    end
  end
end
