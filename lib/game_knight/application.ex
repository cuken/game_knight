defmodule GameKnight.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GameKnightWeb.Telemetry,
      GameKnight.Repo,
      {DNSCluster, query: Application.get_env(:game_knight, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: GameKnight.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: GameKnight.Finch},
      # Start a worker by calling: GameKnight.Worker.start_link(arg)
      # {GameKnight.Worker, arg},
      # Start to serve requests, typically the last entry
      GameKnightWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :game_knight]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameKnight.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GameKnightWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
