defmodule ApiSalesWeb.Router do
  use ApiSalesWeb, :router
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiSalesWeb do
    pipe_through :api
    resources "/events", EventController, only: [:index, :create]
  end
end
