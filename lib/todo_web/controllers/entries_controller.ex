defmodule TodoWeb.EntryController do
  use TodoWeb, :controller

  alias Todo.Repo
  alias Todo.TodoLists
  alias Todo.TodoLists.Entry

  def create(conn, %{"list_id" => list_id, "entry" => entry_params}) do
    list = TodoLists.get_list(list_id)
    
    case TodoLists.create_entry(list, entry_params) do
      {:ok, entry} ->
        conn
        |> put_flash(:info, "Entry created successfully.")
        |> redirect(to: Routes.list_path(conn, :show, list))

      {:error, %Ecto.Changeset{} = changeset} ->
        list = list
        |> Repo.preload(:entries)

        render(conn, TodoWeb.ListView, "show.html", changeset: changeset, list: list)
    end
  end
end