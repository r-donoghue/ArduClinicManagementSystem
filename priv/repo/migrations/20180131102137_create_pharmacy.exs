defmodule Cmsv1.Repo.Migrations.CreatePharmacy do
  use Ecto.Migration

  def change do
    create table(:pharms, primary_key: false) do
      add :pharm_id, :uuid, primary_key: true
      add :name, :string
      add :address, :string
      add :mobile_number, :string
      add :landline_number, :string
      add :fax, :string
      add :email, :string
      add :contact_person, :string
      add :contact_person_number, :string

      timestamps()
    end

  end
end
