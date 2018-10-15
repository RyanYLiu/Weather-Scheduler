defmodule WeatherScheduler.Application do
  use Application

  def start(_type, _args) do

    import Supervisor.Spec

    children = [
      supervisor(WeatherScheduler.Repo, []),
      worker(WeatherScheduler.Periodically, [])
    ]
    opts = [strategy: :one_for_one, name: WeatherScheduler.Supervisor]
    Supervisor.start_link(children, opts)
  end
end