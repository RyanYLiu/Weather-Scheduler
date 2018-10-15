defmodule WeatherScheduler.Repo.Migrations.CreateWeather do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :time, :string
      add :temperature, :float
    end
  end
end
