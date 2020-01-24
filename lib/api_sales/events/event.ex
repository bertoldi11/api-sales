defmodule ApiSales.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :timestamp, :utc_datetime, null: false
    field :event, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:event, :timestamp])
    |> validate_required([:event, :timestamp])
  end
end
