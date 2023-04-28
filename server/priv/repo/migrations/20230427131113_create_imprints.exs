defmodule KBachBlackboardApi.Repo.Migrations.CreateImprints do
  use Ecto.Migration

  def change do
    create table(:imprints, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :public, :boolean, default: false, null: false
      add :forename, :string
      add :surname, :string
      add :phone, :string
      add :email, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create unique_index(:imprints, [:email])
    create unique_index(:imprints, [:phone])
    create index(:imprints, [:user_id])
  end
end
