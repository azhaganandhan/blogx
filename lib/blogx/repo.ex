defmodule Blogx.Repo do
  use Ecto.Repo,
    otp_app: :blogx,
    adapter: Ecto.Adapters.Postgres
end
