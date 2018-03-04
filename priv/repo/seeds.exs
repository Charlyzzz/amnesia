# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Amnesia.Repo.insert!(%Amnesia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Amnesia.{Repo, Utils}
alias Amnesia.Tasks.Task

Repo.insert! %Task{
  title: "Check out last ExConf",
  description: "Watch all videos from Erlang Solutions's Youtube channel.",
  due_date: Utils.datetime_from_iso8601("2018-05-01T12:00:00.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Take the dog for a walk",
  description: "Musi needs to pee. Don't forget!!",
  due_date: Utils.datetime_from_iso8601("2018-02-01T10:00:00.000000Z"),
  completed: true
}

Repo.insert! %Task{
  title: "Take the dog for a walk",
  description: "Musi needs to pee. Don't forget!!",
  due_date: Utils.datetime_from_iso8601("2018-02-01T16:00:00.000000Z"),
  completed: true
}

Repo.insert! %Task{
  title: "Take the dog for a walk",
  description: "Musi needs to pee. Don't forget!!",
  due_date: Utils.datetime_from_iso8601("2018-02-02T02:00:00.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Take the dog for a walk",
  description: "Musi needs to pee. Don't forget!!",
  due_date: Utils.datetime_from_iso8601("2018-02-02T10:00:00.000000Z"),
  completed: true
}

Repo.insert! %Task{
  title: "Pay healthcare bill",
  description: "Osde envelope is next to the monitor.",
  due_date: Utils.datetime_from_iso8601("2018-03-08T23:59:59.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Buy a new suit for Lis's wedding",
  description: "Ask Exe to come too.",
  due_date: Utils.datetime_from_iso8601("2018-03-03T12:30:00.000000Z"),
  completed: true
}

Repo.insert! %Task{
  title: "Finish Elixir talk",
  description: "Focus on concurrency and BEAM.",
  due_date: Utils.datetime_from_iso8601("2018-03-16T15:30:00.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Ask Michelle about the bag",
  description: "Remember to bring the money $$$.",
  due_date: Utils.datetime_from_iso8601("2018-03-12T12:30:00.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Clean the pool",
  description: "Before the summer ends.",
  due_date: Utils.datetime_from_iso8601("2018-02-10T00:00:00.000000Z"),
  completed: false
}

Repo.insert! %Task{
  title: "Make an appointment with the new Dentist",
  description: "Ask Lucas because he know her.",
  due_date: Utils.datetime_from_iso8601("2018-02-25T15:00:00.000000Z"),
  completed: false
}
