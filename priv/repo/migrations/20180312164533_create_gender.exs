defmodule Cmsv1.Repo.Migrations.CreateGender do
  use Ecto.Migration

  def change do
    create table(:genders) do
      add :gender, :string

      timestamps()
    end

  end
end
