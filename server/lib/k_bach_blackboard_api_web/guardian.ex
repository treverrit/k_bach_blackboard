defmodule KBachBlackboardApiWeb.Guardian do
  use Guardian, otp_app: :k_bach_blackboard_api

  alias KBachBlackboardApi.Accounts

  def subject_for_token(%{id: id}, _claims), do: {:ok, to_string(id)}
  def subject_for_token(_params, _claims), do: {:error, "No ID provided"}

  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_account!(id) do
      nil -> {:error, "not found"}
      resource -> {:ok, resource}
    end
  end

  def resource_from_claims(_params), do: {:error, "No ID provided"}
end
