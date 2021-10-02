defmodule Synthylizer.Instruments do
  @moduledoc """
  The Instruments context.
  """

  import Ecto.Query, warn: false
  alias Synthylizer.Repo

  alias Synthylizer.Instruments.Synth

  @doc """
  Returns the list of synths.

  ## Examples

      iex> list_synths()
      [%Synth{}, ...]

  """
  def list_synths do
    Repo.all(Synth)
  end

  @doc """
  Returns a list of synths matching the given `criteria`.

  Example Criteria:

  [{:limit, 15}, {:order, :asc}, {:filter, [{:matching, "sub"}, {:keys, 0}]}]
  """
  def list_synths(criteria) do
    query = from s in Synth

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
  Gets a single synth.

  Raises `Ecto.NoResultsError` if the Synth does not exist.

  ## Examples

      iex> get_synth!(123)
      %Synth{}

      iex> get_synth!(456)
      ** (Ecto.NoResultsError)

  """
  def get_synth!(id), do: Repo.get!(Synth, id)

  @doc """
  Returns the synth with the given `slug`.

  Raises `Ecto.NeResultsError` if no synth was found.
  """
  def get_synth_by_slug!(slug) do
    Repo.get_by!(Synth, slug: slug)
  end

  @doc """
  Creates a synth.

  ## Examples

      iex> create_synth(%{field: value})
      {:ok, %Synth{}}

      iex> create_synth(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_synth(attrs \\ %{}) do
    %Synth{}
    |> Synth.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a synth.

  ## Examples

      iex> update_synth(synth, %{field: new_value})
      {:ok, %Synth{}}

      iex> update_synth(synth, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_synth(%Synth{} = synth, attrs) do
    synth
    |> Synth.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a synth.

  ## Examples

      iex> delete_synth(synth)
      {:ok, %Synth{}}

      iex> delete_synth(synth)
      {:error, %Ecto.Changeset{}}

  """
  def delete_synth(%Synth{} = synth) do
    Repo.delete(synth)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking synth changes.

  ## Examples

      iex> change_synth(synth)
      %Ecto.Changeset{data: %Synth{}}

  """
  def change_synth(%Synth{} = synth, attrs \\ %{}) do
    Synth.changeset(synth, attrs)
  end
end
