#!/bin/sh
# wait-for-postgres.sh
set -e

# Wait for Postgres to become available.
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
>&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

mix deps.get
mix phx.gen.cert
mix ecto.create
mix ecto.migrate
mix phx.server
