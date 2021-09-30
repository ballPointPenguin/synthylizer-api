defmodule Synthylizer.InstrumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Synthylizer.Instruments` context.
  """

  alias Synthylizer.Repo

  alias Synthylizer.Instruments
  alias Synthylizer.Instruments.{Synthesizer}

  @doc """
  Generate a synthesizer.
  """
  def synthesizer_fixture(attrs \\ %{}) do
    {:ok, synthesizer} =
      attrs
      |> Enum.into(%{
        description: "some description",
        keys: 42,
        name: "some name",
        slug: "some-name",
        polyphony: "some polyphony",
        release_year: 42,
        synthesis_type: "some synthesis_type"
      })
      |> Instruments.create_synthesizer()

    synthesizer
  end

  def synthesizers_fixture() do
    synth1 =
      %Synthesizer{
        description: "description-1",
        keys: 37,
        name: "Synth 1",
        slug: "synth-1",
        polyphony: "Monophonic",
        release_year: 1980,
        synthesis_type: "Analog subtractive"
      } |> Repo.insert!

    synth2 =
      %Synthesizer{
        description: "description-2",
        keys: 88,
        name: "Synth 2",
        slug: "synth-2",
        polyphony: "Polyphonic",
        release_year: 1990,
        synthesis_type: "FM"
      } |> Repo.insert!

    synth3 =
      %Synthesizer{
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
