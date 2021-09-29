defmodule SynthylizerWeb.SynthesizerController do
  use SynthylizerWeb, :controller

  alias Synthylizer.Instruments
  alias Synthylizer.Instruments.Synthesizer

  def index(conn, _params) do
    synthesizers = Instruments.list_synthesizers()
    render(conn, "index.html", synthesizers: synthesizers)
  end

  def new(conn, _params) do
    changeset = Instruments.change_synthesizer(%Synthesizer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"synthesizer" => synthesizer_params}) do
    case Instruments.create_synthesizer(synthesizer_params) do
      {:ok, synthesizer} ->
        conn
        |> put_flash(:info, "Synthesizer created successfully.")
        |> redirect(to: Routes.synthesizer_path(conn, :show, synthesizer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    synthesizer = Instruments.get_synthesizer!(id)
    render(conn, "show.html", synthesizer: synthesizer)
  end

  def edit(conn, %{"id" => id}) do
    synthesizer = Instruments.get_synthesizer!(id)
    changeset = Instruments.change_synthesizer(synthesizer)
    render(conn, "edit.html", synthesizer: synthesizer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "synthesizer" => synthesizer_params}) do
    synthesizer = Instruments.get_synthesizer!(id)

    case Instruments.update_synthesizer(synthesizer, synthesizer_params) do
      {:ok, synthesizer} ->
        conn
        |> put_flash(:info, "Synthesizer updated successfully.")
        |> redirect(to: Routes.synthesizer_path(conn, :show, synthesizer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", synthesizer: synthesizer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    synthesizer = Instruments.get_synthesizer!(id)
    {:ok, _synthesizer} = Instruments.delete_synthesizer(synthesizer)

    conn
    |> put_flash(:info, "Synthesizer deleted successfully.")
    |> redirect(to: Routes.synthesizer_path(conn, :index))
  end
end
