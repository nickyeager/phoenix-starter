defmodule PhoenixStarter.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias PhoenixStarter.Repo

      import Ecto
      import Ecto.Query
      import PhoenixStarter.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PhoenixStarter.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PhoenixStarter.Repo, {:shared, self()})
    end

    :ok
  end
end
