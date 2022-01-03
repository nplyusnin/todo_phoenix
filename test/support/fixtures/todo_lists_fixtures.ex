defmodule Todo.TodoListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhxBlog.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Todo.TodoLists.create_list()

    list
  end

  def etnry_fixture(attrs \\ %{}) do
    list = list_fixture()

    entry_attrs =
      attrs
      |> Enum.into(%{
        body: "some body"
      })

    {:ok, entry} = Todo.TodoLists.create_entry(list, entry_attrs)

    entry
  end
end
