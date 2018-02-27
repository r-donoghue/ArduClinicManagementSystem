defmodule Cmsv1.Repo.Migrations.ChangePhnumberType do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :ph_number
      add :ph_number, :binary
    end
  end
end
