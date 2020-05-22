defmodule Dashtag.Repo do
  use Ecto.Repo,
    otp_app: :dashtag,
    adapter: Ecto.Adapters.Postgres
end
