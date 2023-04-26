defmodule KBachBlackboardApi.Graphql.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field :id, :id
    field :bio, :string
  end
end
