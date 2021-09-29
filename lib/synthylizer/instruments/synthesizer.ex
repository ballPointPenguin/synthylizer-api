defmodule Synthylizer.Instruments.Synthesizer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "synthesizers" do
    field :description, :string
    field :keys, :integer
    field :name, :string
    field :polyphony, :string
    field :release_year, :integer
    field :synthesis_type, :string

    timestamps()
  end

  @doc false
  def changeset(synthesizer, attrs) do
    synthesizer
    |> cast(attrs, [:name, :description, :release_year, :polyphony, :synthesis_type, :keys])
    |> validate_required([:name, :description, :release_year, :polyphony, :synthesis_type, :keys])
  end
end
