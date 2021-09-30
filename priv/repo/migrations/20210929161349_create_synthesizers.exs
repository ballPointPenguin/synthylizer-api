defmodule Synthylizer.Repo.Migrations.CreateSynthesizers do
  use Ecto.Migration

  def change do
    create table(:synthesizers) do
      add :name, :string, null: false
      add :slug, :string, null: false
      add :description, :string
      add :release_year, :integer
      add :polyphony, :string
      add :synthesis_type, :string
      add :keys, :integer

      timestamps()
    end

    create unique_index(:synthesizers, [:name])
    create unique_index(:synthesizers, [:slug])
  end
end
