# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :amnesia,
  ecto_repos: [Amnesia.Repo]

# Configures the endpoint
config :amnesia, AmnesiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1jh1gxx8YJNwTMINuVIsqm7MH1h51JUjfgvaPllCDWKS6eSHDoy3Y1hjM4a0HQ9S",
  render_errors: [view: AmnesiaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Amnesia.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
