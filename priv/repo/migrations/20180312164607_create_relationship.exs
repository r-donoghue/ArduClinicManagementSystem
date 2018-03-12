defmodule Cmsv1.Repo.Migrations.CreateRelationship do
  use Ecto.Migration

  def change do
    create table(:relationships) do
      add :relationship, :string

      timestamps()
    end

  end
end
