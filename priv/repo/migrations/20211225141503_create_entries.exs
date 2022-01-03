defmodule Todo.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :body, :text
      add :list_id, references(:lists, on_delete: :delete_all)

      timestamps()
    end

    create index(:entries, [:list_id])
  end
end