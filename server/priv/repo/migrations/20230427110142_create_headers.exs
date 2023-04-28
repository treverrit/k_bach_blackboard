defmodule KBachBlackboardApi.Repo.Migrations.CreateHeaders do
  use Ecto.Migration

  def change do
    create table(:headers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :avatar, :string
      add :banner, :string
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:headers, [:user_id])
  end
end
