defmodule Todo.TodoListsTest do
  use Todo.DataCase

  alias Todo.TodoLists

  describe "lists" do
    alias Todo.TodoLists.List
    alias Todo.TodoLists.Entry

    import Todo.TodoListsFixtures

    @invalid_attrs %{title: nil}

    test "lists/0 returns all lists" do
      list = list_fixture()
      assert TodoLists.lists() == [list]
    end

    test "get_list/1 returns the list with given id" do
      list = list_fixture()
      assert TodoLists.get_list(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %List{} = list} = TodoLists.create_list(valid_attrs)
      assert list.title == "some title"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoLists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %List{} = list} = TodoLists.update_list(list, update_attrs)
      assert list.title == "some updated title"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoLists.update_list(list, @invalid_attrs)
      assert list == TodoLists.get_list(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = TodoLists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> TodoLists.get_list(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = TodoLists.change_list(list)
    end

    test "create_entry/2 with valid data creates a entry" do
      list = list_fixture()
      valid_attrs = %{body: "some body"}
      assert {:ok, %Entry{} = entry} = TodoLists.create_entry(list, valid_attrs)
      assert entry.body == "some body"
    end

    test "create_entry/2 with invalid data returns error changeset" do
      list = list_fixture()
      invalid_attrs = %{body: nil}

      assert {:error, %Ecto.Changeset{}} = TodoLists.create_entry(list, invalid_attrs)
    end

    test "change_entry/1 returns a entry changeset" do
      entry = etnry_fixture()
      assert %Ecto.Changeset{} = TodoLists.change_entry(entry)
    end
  end
end
