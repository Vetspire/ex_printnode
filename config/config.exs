use Mix.Config

config :ex_printnode,
  api_key: System.get_env("PRINT_NODE_API_KEY") || "printnode-api-key"
