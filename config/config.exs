# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cmsv1,
  ecto_repos: [Cmsv1.Repo]

# Configures the endpoint
config :cmsv1, Cmsv1.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j9VrLxZpJO8fO9A5yaApqaqTyBVG8VHF+Bo8moPbyVgSlRirqJwDpAvG86j++yH1",
  render_errors: [view: Cmsv1.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cmsv1.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  drab: Drab.Live.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
