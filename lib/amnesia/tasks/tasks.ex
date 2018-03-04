defmodule Amnesia.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias Amnesia.Repo

  alias Amnesia.Tasks.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    {uncompleted_tasks(), completed_tasks(), expired_tasks()}
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id), do: Repo.get!(Task, id)

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
      
    %Task{}
    |> Task.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.update_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  defp completed_tasks do
    Repo.all(from task in Task, where: task.completed == true)
  end
  
  defp uncompleted_tasks do
    Repo.all(from task in Task, where: task.completed == false and task.due_date > ^DateTime.utc_now)
  end

  defp expired_tasks do
    Repo.all(from task in Task, where: task.completed == false and task.due_date <= ^DateTime.utc_now)
  end
end
