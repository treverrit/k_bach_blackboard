defmodule KBachBlackboardApi.Imprints do
  @moduledoc """
  The Imprints context.
  """

  import Ecto.Query, warn: false
  alias KBachBlackboardApi.Repo

  alias KBachBlackboardApi.Imprints.Imprint
  alias KBachBlackboardApi.Users.User

  @doc """
  Returns the list of imprints.

  ## Examples

      iex> list_imprints()
      [%Imprint{}, ...]

  """
  def list_imprints do
    Repo.all(Imprint)
  end

  @doc """
  Gets a single imprint.

  Raises `Ecto.NoResultsError` if the Imprint does not exist.

  ## Examples

      iex> get_imprint!(123)
      %Imprint{}

      iex> get_imprint!(456)
      ** (Ecto.NoResultsError)

  """
  def get_imprint!(id), do: Repo.get!(Imprint, id)

  @doc """
  Creates a imprint.

  ## Examples

      iex> create_imprint(%{field: value})
      {:ok, %Imprint{}}

      iex> create_imprint(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_imprint(%User{} = user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:imprint)
    |> Imprint.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a imprint.

  ## Examples

      iex> update_imprint(imprint, %{field: new_value})
      {:ok, %Imprint{}}

      iex> update_imprint(imprint, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_imprint(%Imprint{} = imprint, attrs) do
    imprint
    |> Imprint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a imprint.

  ## Examples

      iex> delete_imprint(imprint)
      {:ok, %Imprint{}}

      iex> delete_imprint(imprint)
      {:error, %Ecto.Changeset{}}

  """
  def delete_imprint(%Imprint{} = imprint) do
    Repo.delete(imprint)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking imprint changes.

  ## Examples

      iex> change_imprint(imprint)
      %Ecto.Changeset{data: %Imprint{}}

  """
  def change_imprint(%Imprint{} = imprint, attrs \\ %{}) do
    Imprint.changeset(imprint, attrs)
  end
end
