defmodule KBachBlackboardApi.Graphql.Types.SessionType do
  use Absinthe.Schema.Notation

  object :session_type do
    field :account, :account_type
    field :token, :string
  end

  input_object :session_input_type do
    field :email, :string
    field :password, :string
  end
end
