defmodule KBachBlackboardApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :bio, :string
    has_one :header, KBachBlackboardApi.Headers.Header
    has_one :imprint, KBachBlackboardApi.Imprints.Imprint
    belongs_to :account, KBachBlackboardApi.Accounts.Account

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:bio])
    |> validate_required([:account_id])
  end
end
