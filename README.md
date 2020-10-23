# PrintNode

[![hex.pm](https://img.shields.io/hexpm/v/ex_printnode.svg)](https://hex.pm/packages/ex_printnode)
[![hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/ex_printnode/)
[![hex.pm](https://img.shields.io/hexpm/dt/ex_printnode.svg)](https://hex.pm/packages/ex_printnode)
[![hex.pm](https://img.shields.io/hexpm/l/ex_printnode.svg)](https://hex.pm/packages/ex_printnode)
[![github.com](https://img.shields.io/github/last-commit/Vetspire/ex_printnode.svg)](https://github.com/Vetspire/ex_printnode/commits/master)

Small [HTTPoison](https://github.com/edgurgel/httpoison) based wrapper around [PrintNode API](https://www.printnode.com/en/docs/api/curl).

## Installation

Add `ex_printnode` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_printnode, "~> 0.1.1"}
  ]
end
```

## Usage

Available methods - use with your API key:

```elixir
PrintNode.Computers.list(api_key: printnode_api_key)
PrintNode.Computers.get(computer_set, api_key: printnode_api_key)

PrintNode.Printers.list(api_key: printnode_api_key)
PrintNode.Printers.list_by_computer(computer_set, api_key: printnode_api_key)
PrintNode.Printers.get(printer_set, api_key: printnode_api_key)

PrintNode.PrintJobs.list(api_key: printnode_api_key)
PrintNode.PrintJobs.get(printjob_set, api_key: printnode_api_key)
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
|> PrintNode.PrintJobs.create(api_key: printnode_api_key)
```
