defmodule Todo.TodoLists do
  import Ecto.Query, warn: false

  alias Todo.Repo
  alias Todo.TodoLists.List
  alias Todo.TodoLists.Entry

  def lists do
    Repo.all(List)
  end

  def get_list(id) do
    Repo.get!(List, id)
  end

  def create_list(attrs \\ %{}) do
    %List{}
    |> List.changeset(attrs)
    |> Repo.insert()
  end

  def update_list(%List{} = list, attrs) do
    list
    |> List.changeset(attrs)
    |> Repo.update()
  end

  def delete_list(%List{} = list) do
    Repo.delete(list)
  end

  def change_list(%List{} = list, attrs \\ %{}) do
    List.changeset(list, attrs)
  end

  def create_entry(%List{} = list, attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:list, list)
    |> Repo.insert()
  end

  def change_entry(%Entry{} = entry, attrs \\ %{}) do
    Entry.changeset(entry, attrs)
  end
end