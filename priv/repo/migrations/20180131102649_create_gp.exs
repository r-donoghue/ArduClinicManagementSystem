defmodule Cmsv1.Repo.Migrations.CreateGP do
  use Ecto.Migration

  def change do
    create table(:gps, primary_key: false) do
      add :gp_id, :uuid, primary_key: true
      add :name, :string
      add :address, :string
      add :mobile_number, :string
      add :landline_number, :string
      add :fax, :string
      add :email, :string
      add :training_level, :string

      timestamps()
    end

  end
end
