defmodule WeatherScheduler.Periodically do
  use GenServer
  alias WeatherScheduler
  alias WeatherScheduler.Repo
  alias WeatherScheduler.Weather

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    weather = %Weather{time: WeatherScheduler.get_weather[:time], temperature: WeatherScheduler.get_weather[:temperature]}
    Repo.insert!(weather)
    schedule_work()
    {:ok, state}
  end

  def handle_info(:get_weather, state) do
    weather = %Weather{time: WeatherScheduler.get_weather[:time], temperature: WeatherScheduler.get_weather[:temperature]}
    Repo.insert!(weather)
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :get_weather, Application.get_env(:weather_scheduler, __MODULE__)[:time])
  end
end
