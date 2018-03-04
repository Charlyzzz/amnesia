defmodule Amnesia.TasksTest do
  use Amnesia.DataCase

  alias Amnesia.Tasks

  describe "tasks" do
    alias Amnesia.Tasks.Task

    @valid_attrs %{description: "some description", due_date: "3010-04-17 14:00:00.000000Z", title: "some title", completed: false}
    @update_attrs %{description: "some updated description", due_date: "2011-05-18 15:01:01.000000Z", title: "some updated title", completed: true}
    @invalid_attrs %{description: nil, due_date: nil, title: nil, completed: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tasks.create_task()

      task
    end

    def task_fixture_update(attrs) do
      {:ok, task} = Tasks.update_task(task_fixture(), attrs)
      
      task
    end

    test "list_tasks/0 returns all tasks grouped" do
      uncompleted_task = task_fixture()
      completed_task = task_fixture_update(%{completed: true})
      expired_task = task_fixture(%{due_date: "1010-04-17 14:00:00.000000Z"})

      assert Tasks.list_tasks() == {[uncompleted_task], [completed_task], [expired_task]}
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tasks.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.due_date == DateTime.from_naive!(~N[3010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert task.title == "some title"
      assert task.completed == false
    end

    test "create_task/1 defaults complete to false" do
      assert {:ok, %Task{} = task} = Tasks.create_task(%{@valid_attrs| completed: true})
      assert task.completed == false
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tasks.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.description == "some updated description"
      assert task.due_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert task.title == "some updated title"
      assert task.completed == true
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end
  end
end
