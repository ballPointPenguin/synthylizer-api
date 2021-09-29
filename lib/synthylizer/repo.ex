defmodule Synthylizer.Repo do
  use Ecto.Repo,
    otp_app: :synthylizer,
    adapter: Ecto.Adapters.Postgres
end
