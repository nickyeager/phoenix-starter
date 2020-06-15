defmodule DashtagWeb.Router do
  use DashtagWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
      extensions: [PowResetPassword, PowEmailConfirmation, PowInvitation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :put_root_layout, {DashtagWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug DashtagWeb.EnsureRolePlug, :admin
  end

  # BEGIN added for Pow
  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
         error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
         error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", DashtagWeb do
    pipe_through [:browser]
    get "/", PageController, :index
  end

  scope "/api/v1", DashtagWeb do
    pipe_through [:api, :protected]
    get "/users", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", DashtagWeb do
  #   pipe_through :api
  # end
end
