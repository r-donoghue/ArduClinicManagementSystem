defmodule Cmsv1.Repo.Migrations.CreateVaccBrand do
  use Ecto.Migration

  def change do
    create table(:vaccbrands) do
      add :vaccbrand, :string

      timestamps()
    end

  end
end
