defmodule KBachBlackboardApi.Imprints.Imprint do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "imprints" do
    field :email, :string
    field :forename, :string
    field :phone, :string
    field :public, :boolean, default: false
    field :surname, :string
    belongs_to :user, KBachBlackboardApi.User.Users

    timestamps()
  end

  @doc false
  def changeset(imprint, attrs) do
    imprint
    |> cast(attrs, [:public, :forename, :surname, :phone, :email])
    |> validate_required([:user_id])
    |> unique_constraint(:email)
    |> unique_constraint(:phone)
  end
end
