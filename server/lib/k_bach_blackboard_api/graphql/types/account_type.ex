defmodule KBachBlackboardApi.Graphql.Types.AccountType do
  use Absinthe.Schema.Notation

  object :account_type do
    field :id, :id
    field :email, :string
    field :user, :user_type
  end

  input_object :account_input_type do
    field :email, non_null(:string)
    field :password, non_null(:string)
    field :password_confirmation, non_null(:string)
  end
end
