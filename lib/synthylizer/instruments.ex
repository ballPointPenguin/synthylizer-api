defmodule Synthylizer.Instruments do
  @moduledoc """
  The Instruments context.
  """

  import Ecto.Query, warn: false
  alias Synthylizer.Repo

  alias Synthylizer.Instruments.Synthesizer

  @doc """
  Returns the synthesizer with the given `slug`.

  Raises `Ecto.NeResultsError` if no synth was found.
  """
  def get_synthesizer_by_slug!(slug) do
    Repo.get_by!(Synthesizer, slug: slug)
  end

  @doc """
  Returns the list of synthesizers.

  ## Examples

      iex> list_synthesizers()
      [%Synthesizer{}, ...]

  """
  def list_synthesizers do
    Repo.all(Synthesizer)
  end

  @doc """
  Returns a list of synths matching the given `criteria`.

  Example Criteria:

  [{:limit, 15}, {:order, :asc}, {:filter, [{:matching, "sub"}, {:keys, 0}]}]
  """
  def list_synthesizers(criteria) do
    query = from s in Synthesizer

    Enum.reduce(criteria, query, fn
      {:limit, limit}, query ->
        query |> limit(^limit)

      {:filter, filters}, query ->
        filter_with(filters, query)

      {:order, order}, query ->
        query |> order_by({^order, :id})
    end)
    |> Repo.all
  end

  defp filter_with(filters, query) do
    Enum.reduce(filters, query, fn
      {:matching, term}, query ->
        pattern = "%#{term}%"

        from q in query,
          where:
            ilike(q.name, ^pattern) or
            ilike(q.description, ^pattern) or
            ilike(q.polyphony, ^pattern) or
            ilike(q.synthesis_type, ^pattern)

      {:keys, count}, query ->
        from q in query, where: q.keys == ^count
      end)
  end

  @doc """
  Gets a single synthesizer.

  Raises `Ecto.NoResultsError` if the Synthesizer does not exist.

  ## Examples

      iex> get_synthesizer!(123)
      %Synthesizer{}

      iex> get_synthesizer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_synthesizer!(id), do: Repo.get!(Synthesizer, id)

  @doc """
  Creates a synthesizer.

  ## Examples

      iex> create_synthesizer(%{field: value})
      {:ok, %Synthesizer{}}

      iex> create_synthesizer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_synthesizer(attrs \\ %{}) do
    %Synthesizer{}
    |> Synthesizer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a synthesizer.

  ## Examples

      iex> update_synthesizer(synthesizer, %{field: new_value})
      {:ok, %Synthesizer{}}

      iex> update_synthesizer(synthesizer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_synthesizer(%Synthesizer{} = synthesizer, attrs) do
    synthesizer
    |> Synthesizer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a synthesizer.

  ## Examples

      iex> delete_synthesizer(synthesizer)
      {:ok, %Synthesizer{}}

      iex> delete_synthesizer(synthesizer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_synthesizer(%Synthesizer{} = synthesizer) do
    Repo.delete(synthesizer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking synthesizer changes.

  ## Examples

      iex> change_synthesizer(synthesizer)
      %Ecto.Changeset{data: %Synthesizer{}}

  """
  def change_synthesizer(%Synthesizer{} = synthesizer, attrs \\ %{}) do
    Synthesizer.changeset(synthesizer, attrs)
  end
end
