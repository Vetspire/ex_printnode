defmodule PrintNode.PrintJobs do
  @moduledoc """
  API interface for PrintJob operations
  """

  alias PrintNode.{Client, Printers}
  alias PrintNode.Resources.PrintJob

  @spec list(PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%PrintJob{}]}
  def list(options) do
    Client.get!("/printjobs", Client.prepare_request_headers(options))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%PrintJob{}]}
  def get(printjob_set, options) do
    Client.get!(
      "/printjobs/#{printjob_set}",
      Client.prepare_request_headers(options)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printjob/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec json_to_printjob(map()) :: %PrintJob{}
  def json_to_printjob(json) do
    PrintJob
    |> struct(json)
    |> Map.update!(:printer, &Printers.json_to_printer/1)
  end

  @spec create(%PrintJob{}, PrintNode.options()) ::
          {:error, String.t()} | {:ok, integer()}
  def create(printjob, options)

  def create(%PrintJob{printer: _printer_id} = printjob, options) do
    Client.post!(
      "/printjobs",
      printjob |> Jason.encode!(),
      Client.prepare_request_headers(options)
    )
    |> case do
      %{body: printjob_id, status_code: 201} ->
        {:ok, printjob_id}

      %{body: %{code: "Conflict"}} ->
        {:error, "Idempotency key collision"}
    end
  end

  def create(_printjob, _options), do: {:error, "invalid printjob parameters"}

  def delete do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
