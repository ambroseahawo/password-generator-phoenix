defmodule PasswordGenerator do
  @moduledoc """
  Generates random password depending on parameters, Module main function is 'generate(options)', takes the options map.

  Options example:
    options = %{
      "length" => "10",
      "numbers" => "false",
      "uppercase" => "false",
      "symbols" => "false"
    }
  The options are only 4, 'length', 'numbers', 'uppercase' and symbols
  """

  @allowed_options [:length, :numbers, :uppercase, :symbols]

  @doc """
  Hello world.

  ## Examples

      iex> PasswordGenerator.hello()
      :world

  """
end
