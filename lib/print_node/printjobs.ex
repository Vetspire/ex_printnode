defmodule PrintNode.PrintJobs do
  def list() do
    PrintNode.Client.get!("/printjobs")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def get(printjob_set) do
    PrintNode.Client.get!("/printjobs/#{printjob_set}")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def json_to_printjob(json) do
    PrintNode.Resources.PrintJob
    |> struct(json)
    |> Map.update!(:printer, &PrintNode.Printers.json_to_printer/1)
  end

  def create(%PrintNode.Resources.PrintJob{printer: _printer_id} = printjob) do
    PrintNode.Client.post!("/printjobs", printjob |> Jason.encode!())
    |> case do
      %{body: printjob_id, status_code: 201} ->
        {:ok, printjob_id}

      %{body: %{code: "Conflict"}} ->
        {:error, "Idempotency key collision"}
    end
  end

  def create(_printjob), do: {:error, "invalid printjob parameters"}

  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
