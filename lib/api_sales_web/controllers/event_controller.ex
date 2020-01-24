defmodule ApiSalesWeb.EventController do
  use ApiSalesWeb, :controller

  alias ApiSales.Events
  alias ApiSales.Events.Event

  action_fallback ApiSalesWeb.FallbackController

  def index(conn, _params) do
    events = Events.list_events()
    render(conn, "index.json", events: events)
  end

  def create(conn, event_params) do
    with {:ok, %Event{}} <- Events.create_event(event_params) do
      events = Events.list_events()
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.event_path(conn, :index, events))
      |> render("index.json", events: events)
    end
  end

end
