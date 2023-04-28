defmodule KBachBlackboardApiWeb.Schema do
  use Absinthe.Schema

  alias KBachBlackboardApi.Graphql.Resolver

  import_types(KBachBlackboardApi.Graphql.Types.AccountType)
  import_types(KBachBlackboardApi.Graphql.Types.SessionType)
  import_types(KBachBlackboardApi.Graphql.Types.UserType)
  import_types(KBachBlackboardApi.Graphql.Types.HeaderType)
  import_types(KBachBlackboardApi.Graphql.Types.ImprintType)

  query do
    @desc "greetings"
    field :hello, :string do
      resolve fn _, _, _ -> "hey dude" end
    end
  end

  mutation do
    @desc "register an account"
    field :register_user, :account_type do
      arg(:input, non_null(:account_input_type))
      resolve &Resolver.AccountResolver.register/3
    end

    @desc "login an account"
    field :login_user, :session_type do
      arg(:input, non_null(:session_input_type))
      resolve &Resolver.SessionResolver.login/3
    end
  end
end
