defmodule KBachBlackboardApi.Graphql.Types.ImprintType do
  use Absinthe.Schema.Notation

  object :imprint_type do
    field :id, :id
    field :public, :boolean
    field :forename, :string
    field :surname, :string
    field :email, :string
    field :phone, :string
  end
end
