defmodule SynthylizerWeb.SynthesizerControllerTest do
  use SynthylizerWeb.ConnCase

  import Synthylizer.InstrumentsFixtures

  @create_attrs %{description: "some description", keys: 42, name: "some name", polyphony: "some polyphony", release_year: 42, synthesis_type: "some synthesis_type"}
  @update_attrs %{description: "some updated description", keys: 43, name: "some updated name", polyphony: "some updated polyphony", release_year: 43, synthesis_type: "some updated synthesis_type"}
  @invalid_attrs %{description: nil, keys: nil, name: nil, polyphony: nil, release_year: nil, synthesis_type: nil}

  describe "index" do
    test "lists all synthesizers", %{conn: conn} do
      conn = get(conn, Routes.synthesizer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Synthesizers"
    end
  end

  describe "new synthesizer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.synthesizer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Synthesizer"
    end
  end

  describe "create synthesizer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.synthesizer_path(conn, :create), synthesizer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.synthesizer_path(conn, :show, id)

      conn = get(conn, Routes.synthesizer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Synthesizer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.synthesizer_path(conn, :create), synthesizer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Synthesizer"
    end
  end

  describe "edit synthesizer" do
    setup [:create_synthesizer]

    test "renders form for editing chosen synthesizer", %{conn: conn, synthesizer: synthesizer} do
      conn = get(conn, Routes.synthesizer_path(conn, :edit, synthesizer))
      assert html_response(conn, 200) =~ "Edit Synthesizer"
    end
  end

  describe "update synthesizer" do
    setup [:create_synthesizer]

    test "redirects when data is valid", %{conn: conn, synthesizer: synthesizer} do
      conn = put(conn, Routes.synthesizer_path(conn, :update, synthesizer), synthesizer: @update_attrs)
      assert redirected_to(conn) == Routes.synthesizer_path(conn, :show, synthesizer)

      conn = get(conn, Routes.synthesizer_path(conn, :show, synthesizer))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, synthesizer: synthesizer} do
      conn = put(conn, Routes.synthesizer_path(conn, :update, synthesizer), synthesizer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Synthesizer"
    end
  end

  describe "delete synthesizer" do
    setup [:create_synthesizer]

    test "deletes chosen synthesizer", %{conn: conn, synthesizer: synthesizer} do
      conn = delete(conn, Routes.synthesizer_path(conn, :delete, synthesizer))
      assert redirected_to(conn) == Routes.synthesizer_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.synthesizer_path(conn, :show, synthesizer))
      end
    end
  end

  defp create_synthesizer(_) do
    synthesizer = synthesizer_fixture()
    %{synthesizer: synthesizer}
  end
end
