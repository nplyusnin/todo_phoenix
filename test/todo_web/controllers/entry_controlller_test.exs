defmodule Todo.EntryControllerTest do
  use TodoWeb.ConnCase

  import Todo.TodoListsFixtures

  @create_attrs %{body: "some body"}
  @invalid_attrs %{body: nil}

  describe "create entry" do
    setup [:create_list]

    test "redirects to show list when data is valid", %{conn: conn, list: list} do
      conn = post(conn, Routes.list_entry_path(conn, :create, list), entry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.list_path(conn, :show, id)

      conn = get(conn, Routes.list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "some title"
    end

    test "renders errors when data is invalid", %{conn: conn, list: list} do
      conn = post(conn, Routes.list_entry_path(conn, :create, list), entry: @invalid_attrs)
      assert html_response(conn, 200) =~ list.title
      assert html_response(conn, 200) =~ "Oops, something went wrong! Please check the errors below."
    end
  end

  defp create_list(_) do
    list = list_fixture()
    %{list: list}
  end
end
