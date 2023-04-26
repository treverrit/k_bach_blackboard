defmodule KBachBlackboardApi.Graphql.Resolver.AccountResolver do
  alias KBachBlackboardApi.Repo
  alias KBachBlackboardApi.{Accounts, Users}
  alias KBachBlackboardApi.{Accounts.Account, Users.User}

  def register(_, %{input: %{email: email, password: password, password_confirmation: confirmation}}, _) do
    with {:ok, %Account{} = account} <- Accounts.create_account(%{email: email, password: password, password_confirmation: confirmation}),
         {:ok, %User{}} <- Users.create_user(account, %{})
    do
      {:ok, account |> Repo.preload(:user)}
    else
      {:error, %Ecto.Changeset{} = changeset} -> {:error, errors(changeset.errors)}
    end
  end

  defp errors(list) do
    list
    |> Keyword.values()
    |> Enum.map(fn error -> elem(error, 0) end)
  end
end
