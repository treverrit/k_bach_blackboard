defmodule KBachBlackboardApi.Headers do
  @moduledoc """
  The Headers context.
  """

  import Ecto.Query, warn: false
  alias KBachBlackboardApi.Repo

  alias KBachBlackboardApi.Headers.Header

  @doc """
  Returns the list of headers.

  ## Examples

      iex> list_headers()
      [%Header{}, ...]

  """
  def list_headers do
    Repo.all(Header)
  end

  @doc """
  Gets a single header.

  Raises `Ecto.NoResultsError` if the Header does not exist.

  ## Examples

      iex> get_header!(123)
      %Header{}

      iex> get_header!(456)
      ** (Ecto.NoResultsError)

  """
  def get_header!(id), do: Repo.get!(Header, id)

  @doc """
  Creates a header.

  ## Examples

      iex> create_header(%{field: value})
      {:ok, %Header{}}

      iex> create_header(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_header(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:header)
    |> Header.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a header.

  ## Examples

      iex> update_header(header, %{field: new_value})
      {:ok, %Header{}}

      iex> update_header(header, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_header(%Header{} = header, attrs) do
    header
    |> Header.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a header.

  ## Examples

      iex> delete_header(header)
      {:ok, %Header{}}

      iex> delete_header(header)
      {:error, %Ecto.Changeset{}}

  """
  def delete_header(%Header{} = header) do
    Repo.delete(header)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking header changes.

  ## Examples

      iex> change_header(header)
      %Ecto.Changeset{data: %Header{}}

  """
  def change_header(%Header{} = header, attrs \\ %{}) do
    Header.changeset(header, attrs)
  end
end
