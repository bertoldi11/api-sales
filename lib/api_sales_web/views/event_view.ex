defmodule ApiSalesWeb.EventView do
  use ApiSalesWeb, :view
  alias ApiSalesWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      event: event.event,
      timestamp: event.timestamp}
  end
end
