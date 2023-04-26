import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :k_bach_blackboard_api, KBachBlackboardApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "k_bach_blackboard_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :k_bach_blackboard_api, KBachBlackboardApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9qSDMDV9D8DGFg7qjmZ24JSfaagcHPE/I+yHaRNz2PkdzdDivJOWGUhSTnCYJzlo",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
