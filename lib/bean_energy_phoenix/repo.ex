defmodule BeanEnergyPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :bean_energy_phoenix,
    adapter: Ecto.Adapters.Postgres
end
