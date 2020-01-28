defmodule ApiSalesWeb.EventControllerTest do
  use ApiSalesWeb.ConnCase

  alias ApiSales.Events
  alias ApiSales.Events.Event

  @create_attrs %{
    timestamp: ~N[2010-04-17 14:00:00],
    event: "some event"
  }
  @invalid_attrs %{timestamp: nil, event: nil}

  def fixture(:event) do
    {:ok, event} = Events.create_event(@create_attrs)
    event
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create event" do
    test "renders event when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), @create_attrs)
      assert [%{"id" => id}] = json_response(conn, 201)["data"]

      conn = get(conn, Routes.event_path(conn, :index))

      assert [
               %{
                 "id" => id,
                 "timestamp" => "2010-04-17T14:00:00Z",
                 "event" => "some event"
               }
             ] = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
