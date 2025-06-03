defmodule Blogx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BlogxWeb.Telemetry,
      # Start the Ecto repository
      Blogx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Blogx.PubSub},
      # Start Finch
      {Finch, name: Blogx.Finch},
      # Start the Endpoint (http/https)
      BlogxWeb.Endpoint
      # Start a worker by calling: Blogx.Worker.start_link(arg)
      # {Blogx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blogx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
