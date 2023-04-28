defmodule KBachBlackboardApi.Headers.Header do
  use Ecto.Schema
  use Waffle.Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "headers" do
    field :avatar, KBachBlackboardApi.Avatar.Type
    field :banner, KBachBlackboardApi.Avatar.Type
    field :name, :string
    belongs_to :user, KBachBlackboardApi.Users.User

    timestamps()
  end

  @doc false
  def changeset(header, attrs) do
    header
    |> cast(attrs, [:name, :user_id])
    |> cast_attachments(attrs, [:avatar, :banner])
    |> validate_required([:user_id, :name])
  end
end
