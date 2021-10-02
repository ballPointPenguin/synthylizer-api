defmodule Synthylizer.Instruments.Synth do
  use Ecto.Schema
  import Ecto.Changeset

  schema "synths" do
    field :description, :string
    field :image, :string
    field :keys, :integer, default: 0
    field :name, :string
    field :polyphony, :string
    field :release_year, :integer
    field :slug, :string
    field :synthesis_type, :string

    timestamps()
  end

  @doc false
  def changeset(synth, attrs) do
    required_fields = [:name]
    optional_fields = [:description, :release_year, :polyphony, :synthesis_type, :keys, :slug, :image]

    synth
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
    |> unique_constraint(:name)
    |> slugify_name()
    |> unique_constraint(:slug)
  end

  defp slugify_name(changeset) do
    case changeset.valid? do
      true ->
        name = get_field(changeset, :name)
        put_change(changeset, :slug, slugify(name))

      _ ->
        changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]/u, "-")
  end
end
