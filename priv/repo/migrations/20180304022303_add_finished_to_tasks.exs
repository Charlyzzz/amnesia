defmodule Amnesia.Repo.Migrations.AddFinishedToTasks do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :completed?, :boolean

    end
  end
end
