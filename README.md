# ApiSales - Auto complete

## Running application in a easy way
You only need to install [Docker](https://docs.docker.com/get-docker/)

```bash
$ docker-compose up
```

## Running application in a more fun way

Dependencies:
  * [elixir](https://elixir-lang.org/install.html)
  * [Erlang](https://www.erlang.org/downloads)
  * [Phoenix Framework](https://hexdocs.pm/phoenix/installation.html#content)
  * [Postegres](https://www.postgresql.org/download/)

To manage dependencies I strongly suggest use [ASDF](https://github.com/asdf-vm/asdf)
Yeah, not much creativity to name the plugin, but believe me, its awesome!

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
To access a https use [https://localhost:4001](https://localhost:4001)


To see all events access: localhost:400/api/events?limit=10?term=event

Neither limit and term are mandatory

If limit is not present in query params, a default will be used (100)

If term is not present in query params, all events will be returned respecting the rule above.

To create a new envent send a post to the same path (localhost:4000/api/events) in the follow format:

```javascript
{ "event": "buy", "timestamp": "2016-09-22T13:57:31.2311892-04:00" }
```

## Script to create a timeline

Dependencies:
 * [PHP](https://www.php.net/downloads)

To run order plugin:

```bash
$ php order.php
```

