# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :ex_printnode,
  api_key: System.fetch_env!("PRINT_NODE_API_KEY")
