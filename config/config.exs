# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_graphql_example,
  ecto_repos: [PhoenixGraphqlExample.Repo]

# Configures the endpoint
config :phoenix_graphql_example, PhoenixGraphqlExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HjuWwWQdJQ9mZcAIT566OThK52fpjZG0r3tXP1vD98uckipMSe7LlT+KOMNjXuDS",
  render_errors: [view: PhoenixGraphqlExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixGraphqlExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "PhoenixGraphqlExample",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "HjuWwWQdJQ9mZcAIT566OThK52fpjZG0r3tXP1vD98uckipMSe7LlT+KOMNjXuDS",
  serializer: PhoenixGraphqlExample.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
