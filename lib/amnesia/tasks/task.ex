defmodule Amnesia.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :description, :string
    field :due_date, :utc_datetime
    field :title, :string
    field :completed, :boolean

    timestamps()
  end

  @doc false
  def create_changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :due_date])
    |> put_change(:completed, false)
    |> validate_task
  end

  @doc false
  def update_changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :due_date, :completed])
    |> validate_task
  end

  defp validate_task(changeset) do
    changeset
    |> validate_required([:title, :description, :due_date, :completed])
    |> validate_length(:title, min: 10, max: 40)
    |> validate_length(:description, max: 200)
  end
end
