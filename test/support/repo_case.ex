defmodule Dashtag.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Dashtag.Repo

      import Ecto
      import Ecto.Query
      import Dashtag.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Dashtag.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Dashtag.Repo, {:shared, self()})
    end

    :ok
  end
end