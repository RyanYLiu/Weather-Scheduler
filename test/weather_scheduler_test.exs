defmodule WeatherSchedulerTest do
  use ExUnit.Case
  doctest WeatherScheduler

  test "greets the world" do
    assert WeatherScheduler.hello() == :world
  end
end
