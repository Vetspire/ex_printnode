defmodule PrintNode.PrintJobs do
  @moduledoc """
  API interface for PrintJob operations
  """

  @spec list(String.t() | nil) :: {:error, String.t()} | {:ok, [%PrintNode.Resources.PrintJob{}]}
  def list(api_key \\ "") do
    PrintNode.Client.get!("/printjobs", PrintNode.Client.prepare_request_headers(api_key))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), String.t() | nil) ::
          {:error, String.t()} | {:ok, [%PrintNode.Resources.PrintJob{}]}
  def get(printjob_set, api_key \\ "") do
    PrintNode.Client.get!(
      "/printjobs/#{printjob_set}",
      PrintNode.Client.prepare_request_headers(api_key)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec json_to_printjob(map()) :: %PrintNode.Resources.PrintJob{}
  def json_to_printjob(json) do
    PrintNode.Resources.PrintJob
    |> struct(json)
    |> Map.update!(:printer, &PrintNode.Printers.json_to_printer/1)
  end

  @spec create(%PrintNode.Resources.PrintJob{}, String.t() | nil) ::
          {:error, String.t()} | {:ok, integer()}
  def create(printjob, api_key \\ "")

  def create(%PrintNode.Resources.PrintJob{printer: _printer_id} = printjob, api_key) do
    PrintNode.Client.post!(
      "/printjobs",
      printjob |> Jason.encode!(),
      PrintNode.Client.prepare_request_headers(api_key)
    )
    |> case do
      %{body: printjob_id, status_code: 201} ->
        {:ok, printjob_id}

      %{body: %{code: "Conflict"}} ->
        {:error, "Idempotency key collision"}
    end
  end

  def create(_printjob, _api_key), do: {:error, "invalid printjob parameters"}

  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
