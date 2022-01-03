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
end
