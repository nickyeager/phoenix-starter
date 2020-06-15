# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenixstarter,
  ecto_repos: [PhoenixStarter.Repo]

# Configures the endpoint
config :phoenixstarter, PhoenixStarterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XUTVw5zJA/FZe6E4L+2CC3TlCktbURnsltUZ/LGmCp8F2ii6NhTC/OAwK44s90iZ",
  render_errors: [view: PhoenixStarterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixStarter.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "I8XmyCoSJB03Q61vYmh2Ha2nyDAeD5Kc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenixstarter, PhoenixStarterWeb.Mailer,
       adapter: Bamboo.SendGridAdapter,
       api_key: "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",
       hackney_opts: [
         recv_timeout: :timer.minutes(1)
       ]

# Pow configuration
config :phoenixstarter, :pow,
       user: PhoenixStarter.Users.User,
       repo: PhoenixStarter.Repo,
       web_module: PhoenixStarterWeb,
       mailer_backend: PhoenixStarterWeb.Mailer
#       extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation],
#       controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
