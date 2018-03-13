defmodule Cmsv1.Repo.Migrations.ChangePatientTable do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :name
      add :fname, :binary
      add :lname, :binary
      add :street, :binary
      add :county, :binary
      add :towncity, :binary
      add :eircode, :binary
      add :nok_rel, :binary
    end
  end
end
