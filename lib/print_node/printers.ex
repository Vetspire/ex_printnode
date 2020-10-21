defmodule PrintNode.Printers do
  def list() do
    PrintNode.Client.get!("/printers")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def get(printer_set) do
    PrintNode.Client.get!("/printers/#{printer_set}")
    |> case do
      %{body: body, status_code: 200} ->
        {:ok, body |> Enum.map(&json_to_printer/1)}

      %{body: body, status_code: _status_code} ->
        {:error, body[:message]}
    end
  end

  def json_to_printer(json) do
    PrintNode.Resources.Printer
    |> struct(json)
    |> Map.update!(:computer, &struct(PrintNode.Resources.Computer, &1))
  end

  def delete() do
    throw({:not_implemented, "please raise PR"})
  end

  def delete(_printer_set) do
    throw({:not_implemented, "please raise PR"})
  end
end
