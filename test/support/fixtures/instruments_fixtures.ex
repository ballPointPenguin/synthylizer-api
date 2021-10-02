defmodule Synthylizer.InstrumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Synthylizer.Instruments` context.
  """

  alias Synthylizer.Repo

  alias Synthylizer.Instruments
  alias Synthylizer.Instruments.Synth

  @doc """
  Generate a synth.
  """
  def synth_fixture(attrs \\ %{}) do
    {:ok, synth} =
      attrs
      |> Enum.into(%{
        description: "some description",
        image: "some-image.jpg",
        keys: 42,
        name: "some name",
        polyphony: "some polyphony",
        release_year: 42,
        slug: "some-name",
        synthesis_type: "some synthesis_type"
      })
      |> Synthylizer.Instruments.create_synth()

    synth
  end

  def synths_fixture() do
    synth1 =
      %Synth{
        description: "description-1",
        keys: 37,
        name: "Synth 1",
        slug: "synth-1",
        polyphony: "Monophonic",
        release_year: 1980,
        synthesis_type: "Analog subtractive"
      } |> Repo.insert!

    synth2 =
      %Synth{
        description: "description-2",
        keys: 88,
        name: "Synth 2",
        slug: "synth-2",
        polyphony: "Polyphonic",
        release_year: 1990,
        synthesis_type: "FM"
      } |> Repo.insert!

    synth3 =
      %Synth{
        description: "description-3",
        keys: 0,
        name: "Synth 3",
        slug: "synth-3",
        polyphony: "Monophonic",
        release_year: 2020,
        synthesis_type: "Analog subtractive"
      } |> Repo.insert!

    [synth1, synth2, synth3]
  end
end
