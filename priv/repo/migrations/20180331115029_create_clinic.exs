defmodule Cmsv1.Repo.Migrations.CreateClinic do
  use Ecto.Migration

  def change do
    create table(:clinics, primary_key: false) do
      add :clinic_id, :uuid, primary_key: true
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
