defmodule Synthylizer.InstrumentsTest do
  use Synthylizer.DataCase

  alias Synthylizer.Instruments

  describe "synthesizers" do
    alias Synthylizer.Instruments.Synthesizer

    import Synthylizer.InstrumentsFixtures

    @invalid_attrs %{description: nil, keys: nil, name: nil, polyphony: nil, release_year: nil, synthesis_type: nil}

    test "list_synthesizers/0 returns all synthesizers" do
      synthesizer = synthesizer_fixture()
      assert Instruments.list_synthesizers() == [synthesizer]
    end

    test "get_synthesizer!/1 returns the synthesizer with given id" do
      synthesizer = synthesizer_fixture()
      assert Instruments.get_synthesizer!(synthesizer.id) == synthesizer
    end

    test "create_synthesizer/1 with valid data creates a synthesizer" do
      valid_attrs = %{description: "some description", keys: 42, name: "some name", polyphony: "some polyphony", release_year: 42, synthesis_type: "some synthesis_type"}

      assert {:ok, %Synthesizer{} = synthesizer} = Instruments.create_synthesizer(valid_attrs)
      assert synthesizer.description == "some description"
      assert synthesizer.keys == 42
      assert synthesizer.name == "some name"
      assert synthesizer.polyphony == "some polyphony"
      assert synthesizer.release_year == 42
      assert synthesizer.synthesis_type == "some synthesis_type"
      assert synthesizer.slug == "some-name"
    end

    test "create_synthesizer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instruments.create_synthesizer(@invalid_attrs)
    end

    test "update_synthesizer/2 with valid data updates the synthesizer" do
      synthesizer = synthesizer_fixture()
      update_attrs = %{description: "some updated description", keys: 43, name: "some updated name", polyphony: "some updated polyphony", release_year: 43, synthesis_type: "some updated synthesis_type"}

      assert {:ok, %Synthesizer{} = synthesizer} = Instruments.update_synthesizer(synthesizer, update_attrs)
      assert synthesizer.description == "some updated description"
      assert synthesizer.keys == 43
      assert synthesizer.name == "some updated name"
      assert synthesizer.polyphony == "some updated polyphony"
      assert synthesizer.release_year == 43
      assert synthesizer.synthesis_type == "some updated synthesis_type"
      assert synthesizer.slug == "some-updated-name"
    end

    test "update_synthesizer/2 with invalid data returns error changeset" do
      synthesizer = synthesizer_fixture()
      assert {:error, %Ecto.Changeset{}} = Instruments.update_synthesizer(synthesizer, @invalid_attrs)
      assert synthesizer == Instruments.get_synthesizer!(synthesizer.id)
    end

    test "delete_synthesizer/1 deletes the synthesizer" do
      synthesizer = synthesizer_fixture()
      assert {:ok, %Synthesizer{}} = Instruments.delete_synthesizer(synthesizer)
      assert_raise Ecto.NoResultsError, fn -> Instruments.get_synthesizer!(synthesizer.id) end
    end

    test "change_synthesizer/1 returns a synthesizer changeset" do
      synthesizer = synthesizer_fixture()
      assert %Ecto.Changeset{} = Instruments.change_synthesizer(synthesizer)
    end
  end
end
