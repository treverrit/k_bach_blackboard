defmodule KBachBlackboardApi.Graphql.Types.HeaderType do
  use Absinthe.Schema.Notation

  object :header_type do
    field :id, :id
    field :name, :string
    field :avatar, :string
    field :banner, :string
  end
end
