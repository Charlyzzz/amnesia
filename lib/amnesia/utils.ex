defmodule Amnesia.Utils do
  
  @doc false
  def datetime_from_iso8601(iso8601) do
    {:ok, datetime, _} = DateTime.from_iso8601(iso8601)
    datetime
  end
end
