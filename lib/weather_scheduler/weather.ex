defmodule WeatherScheduler.Weather do
  use Ecto.Schema

  schema "weather" do
    field :time, :string
    field :temperature, :float
  end
end
