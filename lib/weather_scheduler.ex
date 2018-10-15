defmodule WeatherScheduler do
  require HTTPoison
  require Jason
  @moduledoc """
  Documentation for WeatherScheduler.
  """

  def kelvin_to_celsius(kelvin) do
    kelvin-273.15
  end

  def get_weather do
    json = HTTPoison.get!("https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=#{Application.get_env(:weather_scheduler, __MODULE__)[:apikey]}").body
    |> Jason.decode!()
    {_, datetime} = DateTime.from_unix(json["dt"])
    temp = kelvin_to_celsius(json["main"]["temp"])
    %{time: DateTime.to_string(datetime), temperature: temp}
  end

end
