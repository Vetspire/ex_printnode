defmodule PrintNode.Printers do
  @moduledoc """
  API interface for Printer operations
  """

  @spec list(PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%PrintNode.Resources.Printer{}]}
  def list(options) do
    PrintNode.Client.get!("/printers", PrintNode.Client.prepare_request_headers(options))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%PrintNode.Resources.Printer{}]}
  def get(printer_set, options) do
    PrintNode.Client.get!(
      "/printers/#{printer_set}",
      PrintNode.Client.prepare_request_headers(options)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec json_to_printer(map()) :: %PrintNode.Resources.Printer{}
  def json_to_printer(json) do
    PrintNode.Resources.Printer
    |> struct(json)
    |> Map.update!(:computer, &struct(PrintNode.Resources.Computer, &1))
  end

  @spec delete :: none
  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
