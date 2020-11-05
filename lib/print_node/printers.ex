defmodule PrintNode.Printers do
  @moduledoc """
  API interface for Printer operations
  """

  alias PrintNode.Client
  alias PrintNode.Resources.{Computer, Printer}

  @spec list(PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%Printer{}]}
  def list(options) do
    Client.get!("/printers", Client.prepare_request_headers(options))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec list_by_computer(String.t() | integer(), PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%Printer{}]}
  def list_by_computer(computer_set, options) do
    Client.get!("/computers/#{computer_set}/printers", Client.prepare_request_headers(options))
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec get(String.t() | integer(), PrintNode.options()) ::
          {:error, String.t()} | {:ok, [%Printer{}]}
  def get(printer_set, options) do
    Client.get!(
      "/printers/#{printer_set}",
      Client.prepare_request_headers(options)
    )
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  @spec json_to_printer(map()) :: %Printer{}
  def json_to_printer(json) do
    Printer
    |> struct(json)
    |> Map.update!(:computer, &struct(Computer, &1))
  end

  @spec delete :: none
  def delete do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
