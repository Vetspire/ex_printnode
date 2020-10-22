defmodule PrintNode.Client do
  @moduledoc """
  Wrapper around HTTPoison for making the actual HTTP requests
  """

  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.printnode.com" <> url
  end

  def process_response_body(body) do
    body
    |> Jason.decode!(keys: :atoms)
  end

  def process_request_headers(headers) do
    [{"Content-Type", "application/json"} | headers]
  end

  def prepare_request_headers(api_key) do
    credentials = (api_key <> ":") |> Base.encode64()

    [{"Authorization", "Basic #{credentials}"}]
  end
end
