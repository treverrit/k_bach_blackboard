defmodule KBachBlackboardApi.HeadersTest do
  use KBachBlackboardApi.DataCase

  alias KBachBlackboardApi.Headers

  describe "headers" do
    alias KBachBlackboardApi.Headers.Header

    import KBachBlackboardApi.HeadersFixtures

    @invalid_attrs %{avatar: nil, banner: nil, name: nil}

    test "list_headers/0 returns all headers" do
      header = header_fixture()
      assert Headers.list_headers() == [header]
    end

    test "get_header!/1 returns the header with given id" do
      header = header_fixture()
      assert Headers.get_header!(header.id) == header
    end

    test "create_header/1 with valid data creates a header" do
      valid_attrs = %{avatar: "some avatar", banner: "some banner", name: "some name"}

      assert {:ok, %Header{} = header} = Headers.create_header(valid_attrs)
      assert header.avatar == "some avatar"
      assert header.banner == "some banner"
      assert header.name == "some name"
    end

    test "create_header/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Headers.create_header(@invalid_attrs)
    end

    test "update_header/2 with valid data updates the header" do
      header = header_fixture()
      update_attrs = %{avatar: "some updated avatar", banner: "some updated banner", name: "some updated name"}

      assert {:ok, %Header{} = header} = Headers.update_header(header, update_attrs)
      assert header.avatar == "some updated avatar"
      assert header.banner == "some updated banner"
      assert header.name == "some updated name"
    end

    test "update_header/2 with invalid data returns error changeset" do
      header = header_fixture()
      assert {:error, %Ecto.Changeset{}} = Headers.update_header(header, @invalid_attrs)
      assert header == Headers.get_header!(header.id)
    end

    test "delete_header/1 deletes the header" do
      header = header_fixture()
      assert {:ok, %Header{}} = Headers.delete_header(header)
      assert_raise Ecto.NoResultsError, fn -> Headers.get_header!(header.id) end
    end

    test "change_header/1 returns a header changeset" do
      header = header_fixture()
      assert %Ecto.Changeset{} = Headers.change_header(header)
    end
  end
end
