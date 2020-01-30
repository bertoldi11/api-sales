defmodule ApiSalesWeb.EventController do
  use ApiSalesWeb, :controller

  alias ApiSales.Events
  alias ApiSales.Events.Event

  action_fallback ApiSalesWeb.FallbackController

  def index(%{query_params: %{"term" => term, "limit" => limit}} = conn, _params) do
    limit = if limit > 100 or limit < 1 do 100 else limit end
    events = Events.list_events_by_term(term, limit)
    render(conn, "index.json", events: events)
  end

  def index(%{query_params: %{"term" => term}} = conn, _params) do
    events = Events.list_events_by_term(term)
    render(conn, "index.json", events: events)
  end

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
