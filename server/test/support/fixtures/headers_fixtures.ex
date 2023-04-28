defmodule KBachBlackboardApi.HeadersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KBachBlackboardApi.Headers` context.
  """

  @doc """
  Generate a header.
  """
  def header_fixture(attrs \\ %{}) do
    {:ok, header} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        banner: "some banner",
        name: "some name"
      })
      |> KBachBlackboardApi.Headers.create_header()

    header
  end
end
