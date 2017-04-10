# Localvore Credo Checks

[![Build Status](https://travis-ci.org/localvore-today/localvore-credo-checks.svg?branch=master)](https://travis-ci.org/localvore-today/localvore-credo-checks)

A collection of Credo checks used by the team at Localvore Today.

#### The Checks

- `Localvore.Check.DebugComment` - Check for commented out debug statements:

```elixir
defmodule Example do
  # require Logger

  def important_function(arg1, arg2) do
    # Logger.info("Calling important_function/2")
    # IO.inspect({arg1, arg2})
  end
end
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `localvore_credo_checks` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:localvore_credo_checks, "~> 0.1"}]
end
```

Want to live on the edge?

```elixir
def deps do
  [{:localvore_credo_checks, github: "localvore-today/localvore-credo-checks"}]
end
```
