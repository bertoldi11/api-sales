defmodule ApiSales.Repo.Migrations.CreateEventTable do
  use Ecto.Migration

  def up do
    create table ("events") do
      add :event, :string, null: false
      add :timestamp, :utc_datetime, null: false
      add :inserted_at, :utc_datetime, null: false
      add :updated_at, :utc_datetime
    end
  end

  def down do
    drop table ("events")
  end
end
