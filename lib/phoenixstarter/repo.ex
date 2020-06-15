defmodule PhoenixStarter.Repo do
  use Ecto.Repo,
    otp_app: :phoenixstarter,
    adapter: Ecto.Adapters.Postgres
end
