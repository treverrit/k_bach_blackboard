defmodule KBachBlackboardApi.Graphql.Resolver.AccountResolver do
  alias KBachBlackboardApi.Repo
  alias KBachBlackboardApi.{Accounts, Users, Headers, Imprints}
  alias KBachBlackboardApi.{Accounts.Account, Users.User, Headers.Header, Imprints.Imprint}

  def register(_, %{input: %{email: email, password: password, password_confirmation: confirmation, name: name}}, _) do
    with {:ok, %Account{} = account} <- Accounts.create_account(%{email: email, password: password, password_confirmation: confirmation}),
         {:ok, %User{} = user} <- Users.create_user(account, %{}),
         {:ok, %Header{}} <- Headers.create_header(user, %{name: name}),
         {:ok, %Imprint{}} <- Imprints.create_imprint(user, %{})
    do
      {:ok, account |> Repo.preload(user: [:header, :imprint])}
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
