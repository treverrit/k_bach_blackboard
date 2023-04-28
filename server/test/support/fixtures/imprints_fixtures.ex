defmodule KBachBlackboardApi.ImprintsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KBachBlackboardApi.Imprints` context.
  """

  @doc """
  Generate a unique imprint email.
  """
  def unique_imprint_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique imprint phone.
  """
  def unique_imprint_phone, do: "some phone#{System.unique_integer([:positive])}"

  @doc """
  Generate a imprint.
  """
  def imprint_fixture(attrs \\ %{}) do
    {:ok, imprint} =
      attrs
      |> Enum.into(%{
        email: unique_imprint_email(),
        forename: "some forename",
        phone: unique_imprint_phone(),
        public: true,
        surname: "some surname"
      })
      |> KBachBlackboardApi.Imprints.create_imprint()

    imprint
  end
end
