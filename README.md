# PrintNode

Small [HTTPoison](https://github.com/edgurgel/httpoison) based wrapper around [PrintNode API](https://www.printnode.com/en/docs/api/curl).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_printnode` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_printnode, "~> 0.1.0"}
  ]
end
```

## Usage

Set API key in your configuration:

```elixir
config :ex_printnode,
  api_key: System.fetch_env!("PRINT_NODE_API_KEY")
```

Available methods:

```elixir
PrintNode.Computers.list()
PrintNode.Computers.get(computer_set)

PrintNode.Printers.list()
PrintNode.Printers.get(printer_set)

PrintNode.PrintJobs.list()
PrintNode.PrintJobs.get(printjob_set)
```

### Creating a Print Job

```elixir
%PrintNode.Resources.PrintJob{
  title: "Test",
  content: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  contentType: "pdf_uri",
  source: "printjob-test",
  printer: 123456
}
|> PrintNode.PrintJobs.create()
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_printnode](https://hexdocs.pm/ex_printnode).

