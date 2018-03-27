defmodule Cmsv1.Repo.Migrations.AddToVacc do
  use Ecto.Migration

  def change do
    alter table(:vaccs) do
      add :booster_date, :date
      add :booster_dose, :string
    end
  end
end