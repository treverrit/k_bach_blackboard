# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :k_bach_blackboard_api,
  ecto_repos: [KBachBlackboardApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :k_bach_blackboard_api, KBachBlackboardApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KBachBlackboardApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: KBachBlackboardApi.PubSub,
  live_view: [signing_salt: "fzhFZLXw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :k_bach_blackboard_api, KBachBlackboardApi,
  issuer: "k_bach_blackboard_api",
  secret_key: "XnKXkzBpVeDew1FLTMK5Z29xEkdP8b3gDI+moClHL7+DPetGvDz1Kar5Rv4+a91Q"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
