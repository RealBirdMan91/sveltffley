defmodule Sveltffley.Repo do
  use Ecto.Repo,
    otp_app: :sveltffley,
    adapter: Ecto.Adapters.Postgres
end
