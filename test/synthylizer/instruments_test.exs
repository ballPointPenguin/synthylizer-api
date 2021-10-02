defmodule Synthylizer.InstrumentsTest do
  use Synthylizer.DataCase

  alias Synthylizer.Instruments

  describe "synths" do
    alias Synthylizer.Instruments.Synth

    import Synthylizer.InstrumentsFixtures

    @invalid_attrs %{description: nil, keys: nil, name: nil, polyphony: nil, release_year: nil, synthesis_type: nil}

    test "get_synth_by_slug!/1 returns the synth" do
      synth = synth_fixture()
      assert Instruments.get_synth_by_slug!(synth.slug) == synth
    end

    test "list_synths/0 returns all synths" do
      synth = synth_fixture()
      assert Instruments.list_synths() == [synth]
    end

    test "returns limited number of synths" do
      synths_fixture()

      criteria = %{limit: 2}

      results = Instruments.list_synths(criteria)

      assert length(results) == 2
    end

    test "returns limited and ordered synths" do
      synths_fixture()

      args = %{limit: 2, order: :desc}

      results = Instruments.list_synths(args)

      assert Enum.map(results, &(&1.name)) == ["Synth 3", "Synth 2"]
    end

    test "returns synths filtered by matching name" do
      synths_fixture()

      criteria = %{filter: %{matching: "1"}}

      results = Instruments.list_synths(criteria)

      assert Enum.map(results, &(&1.name)) == ["Synth 1"]
    end

    test "returns synths filtered by matching keys" do
      synths_fixture()

      criteria = %{filter: %{keys: 0}}

      results = Instruments.list_synths(criteria)

      assert Enum.map(results, &(&1.name)) == ["Synth 3"]
    end

    test "get_synth!/1 returns the synth with given id" do
      synth = synth_fixture()
      assert Instruments.get_synth!(synth.id) == synth
    end

    test "create_synth/1 with valid data creates a synth" do
      valid_attrs = %{description: "some description", keys: 42, name: "some name", polyphony: "some polyphony", release_year: 42, synthesis_type: "some synthesis_type"}

      assert {:ok, %Synth{} = synth} = Instruments.create_synth(valid_attrs)
      assert synth.description == "some description"
      assert synth.keys == 42
      assert synth.name == "some name"
      assert synth.polyphony == "some polyphony"
      assert synth.release_year == 42
      assert synth.synthesis_type == "some synthesis_type"
      assert synth.slug == "some-name"
    end

    test "create_synth/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instruments.create_synth(@invalid_attrs)
    end

    test "update_synth/2 with valid data updates the synth" do
      synth = synth_fixture()
      update_attrs = %{description: "some updated description", keys: 43, name: "some updated name", polyphony: "some updated polyphony", release_year: 43, synthesis_type: "some updated synthesis_type"}

      assert {:ok, %Synth{} = synth} = Instruments.update_synth(synth, update_attrs)
      assert synth.description == "some updated description"
      assert synth.keys == 43
      assert synth.name == "some updated name"
      assert synth.polyphony == "some updated polyphony"
      assert synth.release_year == 43
      assert synth.synthesis_type == "some updated synthesis_type"
      assert synth.slug == "some-updated-name"
    end

    test "update_synth/2 with invalid data returns error changeset" do
      synth = synth_fixture()
      assert {:error, %Ecto.Changeset{}} = Instruments.update_synth(synth, @invalid_attrs)
      assert synth == Instruments.get_synth!(synth.id)
    end

    test "delete_synth/1 deletes the synth" do
      synth = synth_fixture()
      assert {:ok, %Synth{}} = Instruments.delete_synth(synth)
      assert_raise Ecto.NoResultsError, fn -> Instruments.get_synth!(synth.id) end
    end

    test "change_synth/1 returns a synth changeset" do
      synth = synth_fixture()
      assert %Ecto.Changeset{} = Instruments.change_synth(synth)
    end
  end
end
