defmodule Amnesia.Repo.Migrations.RemoveQuestionMarkFromTask do
  use Ecto.Migration

  def change do
    rename table(:tasks), :completed?, to: :completed

  end
end
