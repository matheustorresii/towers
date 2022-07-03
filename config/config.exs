# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :towers, TowersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rvhEJ2iDiFd/lvR2esr59hQXPrVH3CdFVDDhpj+vX+IHdkAR5BsMJotd7GtifdZQ",
  render_errors: [view: TowersWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Towers.PubSub,
  live_view: [signing_salt: "URp2yKxa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
