FROM elixir:1.9.4

RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.4.11 \
  && apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && apt-get install -y postgresql-client \
  && mix local.rebar --force

COPY . /app
WORKDIR /app

RUN chmod +x wait-for-postgres-and-run.sh
RUN chmod 766 ./volumes/database
