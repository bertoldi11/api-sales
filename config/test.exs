use Mix.Config

# Configure your database
config :api_sales, ApiSales.Repo,
  username: "backend_dev",
  password: "backend_dev",
  database: "api_sales_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_sales, ApiSalesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
