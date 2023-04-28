defmodule KBachBlackboardApi.ImprintsTest do
  use KBachBlackboardApi.DataCase

  alias KBachBlackboardApi.Imprints

  describe "imprints" do
    alias KBachBlackboardApi.Imprints.Imprint

    import KBachBlackboardApi.ImprintsFixtures

    @invalid_attrs %{email: nil, forename: nil, phone: nil, public: nil, surname: nil}

    test "list_imprints/0 returns all imprints" do
      imprint = imprint_fixture()
      assert Imprints.list_imprints() == [imprint]
    end

    test "get_imprint!/1 returns the imprint with given id" do
      imprint = imprint_fixture()
      assert Imprints.get_imprint!(imprint.id) == imprint
    end

    test "create_imprint/1 with valid data creates a imprint" do
      valid_attrs = %{email: "some email", forename: "some forename", phone: "some phone", public: true, surname: "some surname"}

      assert {:ok, %Imprint{} = imprint} = Imprints.create_imprint(valid_attrs)
      assert imprint.email == "some email"
      assert imprint.forename == "some forename"
      assert imprint.phone == "some phone"
      assert imprint.public == true
      assert imprint.surname == "some surname"
    end

    test "create_imprint/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Imprints.create_imprint(@invalid_attrs)
    end

    test "update_imprint/2 with valid data updates the imprint" do
      imprint = imprint_fixture()
      update_attrs = %{email: "some updated email", forename: "some updated forename", phone: "some updated phone", public: false, surname: "some updated surname"}

      assert {:ok, %Imprint{} = imprint} = Imprints.update_imprint(imprint, update_attrs)
      assert imprint.email == "some updated email"
      assert imprint.forename == "some updated forename"
      assert imprint.phone == "some updated phone"
      assert imprint.public == false
      assert imprint.surname == "some updated surname"
    end

    test "update_imprint/2 with invalid data returns error changeset" do
      imprint = imprint_fixture()
      assert {:error, %Ecto.Changeset{}} = Imprints.update_imprint(imprint, @invalid_attrs)
      assert imprint == Imprints.get_imprint!(imprint.id)
    end

    test "delete_imprint/1 deletes the imprint" do
      imprint = imprint_fixture()
      assert {:ok, %Imprint{}} = Imprints.delete_imprint(imprint)
      assert_raise Ecto.NoResultsError, fn -> Imprints.get_imprint!(imprint.id) end
    end

    test "change_imprint/1 returns a imprint changeset" do
      imprint = imprint_fixture()
      assert %Ecto.Changeset{} = Imprints.change_imprint(imprint)
    end
  end
end
