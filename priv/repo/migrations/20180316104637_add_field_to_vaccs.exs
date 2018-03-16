defmodule Cmsv1.Repo.Migrations.AddFieldToVaccs do
  use Ecto.Migration

  def change do
    alter table(:vaccs) do
      remove :revacc_type
      add :revacc_date, :date
      add :revacc_type, :string
    end
  end
end
