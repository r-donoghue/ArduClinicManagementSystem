defmodule Cmsv1.User do
    use Cmsv1.Web, :model
    schema "users" do
        field :name, :string
        field :username, :string
        field :password, :string, virtual: true
        field :password_hash, :string
        field :level, :string
        belongs_to :clinics, Cmsv1.Clinic, foreign_key: :clinic_id, type: :binary_id, references: :clinic_id

        timestamps()
    end

    def changeset(model, params \\ %{}) do
        model
        |> cast(params, ~w(name username), [:clinic_id, :level])
        |> validate_length(:username, min: 1, max: 20)
    end

    def registration_changeset(model, params) do
        model
        |> changeset(params)
        |> cast(params, [:name, :username, :password, :clinic_id, :level])
        |> validate_length(:password, min: 6, max: 100)
        |> foreign_key_constraint(:clinic_id)
        |> put_pass_hash()
    end

    defp put_pass_hash(changeset) do
        case changeset do
        %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
        _ ->
        changeset
        end
        end
end