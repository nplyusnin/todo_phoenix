defmodule Todo.TodoLists.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :body, :string
    belongs_to :list, Todo.TodoLists.List

    timestamps()
  end

  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end