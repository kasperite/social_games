import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :social_games, SocialGames.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "social_games_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :social_games, SocialGamesWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4g+4DhJg7AQAIw4MVhN//57e1O1yv7a0ByZGds0vHoufxoVl5dky87Ba+CCUQMri",
  server: false

# In test we don't send emails.
config :social_games, SocialGames.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
