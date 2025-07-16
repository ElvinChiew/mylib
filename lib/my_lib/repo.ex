defmodule MyLib.Repo do
  use Ecto.Repo,
    otp_app: :my_lib,
    adapter: Ecto.Adapters.Postgres
end
