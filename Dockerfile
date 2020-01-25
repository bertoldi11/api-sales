FROM elixir:1.9.4

RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.4.11 \
  && apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.rebar --force

COPY . /app
WORKDIR /app


EXPOSE 4001

CMD ["mix", "phx.server"]
