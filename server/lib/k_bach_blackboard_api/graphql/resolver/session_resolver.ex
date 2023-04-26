defmodule KBachBlackboardApi.Graphql.Resolver.SessionResolver do
  alias KBachBlackboardApi.Accounts.Account
  alias KBachBlackboardApi.Accounts
  alias KBachBlackboardApiWeb.Guardian

  def login(_, %{input: input}, _) do
    with {:ok, %Account{} = account} <- authenticate(input),
         {:ok, jwt, _claims} <- Guardian.encode_and_sign(account)
    do
      {:ok, %{account: account, token: jwt}}
    else
      {:error, reason} -> {:error, ":/ #{reason}"}
    end
  end

  defp authenticate(params) do
    with %Account{} = account <- Accounts.get_account_by_email!(params.email),
         true <- Argon2.verify_pass(params.password, account.password_hash)
    do
      {:ok, account}
    else
      nil ->
        Argon2.no_user_verify()
        {:error, "Invalid Login Credentials"}
      false -> {:error, "Invalid Password"}
    end
  end
end
