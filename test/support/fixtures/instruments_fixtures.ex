defmodule Synthylizer.InstrumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Synthylizer.Instruments` context.
  """

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
      |> Synthylizer.Instruments.create_synthesizer()

    synthesizer
  end
end
