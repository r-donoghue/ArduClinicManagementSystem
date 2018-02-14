defmodule Cmsv1.Repo.Migrations.CreateInactivity do
  use Ecto.Migration

  def change do
    create table(:reasons) do
      add :reason, :string

      timestamps()
    end

  end
end
