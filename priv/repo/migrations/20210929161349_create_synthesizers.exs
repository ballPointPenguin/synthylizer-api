defmodule Synthylizer.Repo.Migrations.CreateSynthesizers do
  use Ecto.Migration

  def change do
    create table(:synthesizers) do
      add :name, :string
      add :description, :string
      add :release_year, :integer
      add :polyphony, :string
      add :synthesis_type, :string
      add :keys, :integer

      timestamps()
    end
  end
end
