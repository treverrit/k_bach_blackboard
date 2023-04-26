defmodule KBachBlackboardApi.Repo do
  use Ecto.Repo,
    otp_app: :k_bach_blackboard_api,
    adapter: Ecto.Adapters.Postgres
end
