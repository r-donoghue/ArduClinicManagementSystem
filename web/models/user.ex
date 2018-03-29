defmodule Cmsv1.User do
    use Cmsv1.Web, :model

    schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps
    end
end