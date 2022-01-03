defmodule Todo.TodoLists.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :title, :string
    has_many :entries, Todo.TodoLists.Entry

    timestamps()
  end

  def changeset(list, attrs) do
    list
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end