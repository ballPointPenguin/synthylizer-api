defmodule Synthylizer.Repo.Migrations.CreateSynths do
  use Ecto.Migration

  def change do
    create table(:synths) do
      add :name, :string, null: false
      add :description, :string
      add :image, :string
      add :keys, :integer
      add :polyphony, :string
      add :release_year, :integer
      add :slug, :string, null: false
      add :synthesis_type, :string

      timestamps()
    end

    create unique_index(:synths, [:name])
    create unique_index(:synths, [:slug])
  end
end
