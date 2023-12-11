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
  Generates password for a given options.

  ## Examples
    options = %{
      "length" => "10",
      "numbers" => "false",
      "uppercase" => "false",
      "symbols" => "false"
    }

    iex> PasswordGenerator.generate(options)
    "abcdf"


    options = %{
      "length" => "10",
      "numbers" => "true",
      "uppercase" => "false",
      "symbols" => "false"
    }

    iex> PasswordGenerator.generate(options)
    "abc3f"

  """
end
