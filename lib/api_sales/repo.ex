defmodule ApiSales.Repo do
  use Ecto.Repo,
    otp_app: :api_sales,
    adapter: Ecto.Adapters.Postgres
end
