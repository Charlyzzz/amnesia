defmodule AmnesiaWeb.TaskView do
  use AmnesiaWeb, :view
  alias AmnesiaWeb.TaskView

  def render("index.json", %{tasks: {uncompleted_tasks, completed_tasks, expired_tasks}}) do
    %{uncompleted: render_many(uncompleted_tasks, TaskView, "task.json"),
      completed: render_many(completed_tasks, TaskView, "task.json"),
      expired: render_many(expired_tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{task: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      description: task.description,
      dueDate: task.due_date,
      completed: task.completed}
  end
end
