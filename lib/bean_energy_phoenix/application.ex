defmodule BeanEnergyPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BeanEnergyPhoenixWeb.Telemetry,
      # Start the Ecto repository
      BeanEnergyPhoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BeanEnergyPhoenix.PubSub},
      # Start Finch
      {Finch, name: BeanEnergyPhoenix.Finch},
      # Start the Endpoint (http/https)
      BeanEnergyPhoenixWeb.Endpoint
      # Start a worker by calling: BeanEnergyPhoenix.Worker.start_link(arg)
      # {BeanEnergyPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BeanEnergyPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BeanEnergyPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
