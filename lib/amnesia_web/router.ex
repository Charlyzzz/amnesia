defmodule AmnesiaWeb.Router do
  use AmnesiaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AmnesiaWeb do
    pipe_through :api

    resources "/tasks", TaskController
  end
end
