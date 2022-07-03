defmodule TowersWeb.Router do
  import Phoenix.LiveDashboard.Router
  use TowersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TowersWeb do
    pipe_through :api

    if Mix.env() in [:dev, :test] do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: TowersWeb.Telemetry
    end

    get "/*mock_path", MockController, :get
    post "/*mock_path", MockController, :post
    put "/*mock_path", MockController, :put
    delete "/*mock_path", MockController, :delete
  end
end
