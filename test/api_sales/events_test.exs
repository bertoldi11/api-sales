defmodule ApiSales.EventsTest do
  use ApiSales.DataCase

  alias ApiSales.Events

  describe "events" do
    alias ApiSales.Events.Event

    @valid_attrs %{timestamp: ~N[2010-04-17 14:00:00], event: "some event"}
    @update_attrs %{timestamp: ~N[2011-05-18 15:01:01], event: "some updated event"}
    @invalid_attrs %{timestamp: nil, event: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.timestamp == ~U[2010-04-17 14:00:00Z]
      assert event.event == "some event"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
