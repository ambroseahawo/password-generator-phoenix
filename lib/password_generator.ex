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

  @spec generate(options :: map()) :: {:ok, bitstring()} | {:error, bitstring()}
  def generate(options) do
    length = Map.has_key?(options, "length")
    validate_length(length, options)
  end

  defp validate_length(false, _options), do: {:error, "Please provide a length"}

  defp validate_length(true, options) do
    numbers = Enum.map(0..9, & Integer.to_string(&1))
    length = options["length"]
    length = String.contains?(length, numbers)
    validate_length_is_integer(length, options)
  end

  defp validate_length_is_integer(false, _options) do
    {:error, "Only integers allowed for length."}
  end

  defp validate_length_is_integer(true, options) do
    length = options["length"] |> String.trim() |> String.to_integer()
    options_without_length = Map.delete(options, "length")
    options_values = Map.values((options_without_length))
    value = options_values |> Enum.all?(fn x -> String.to_atom(x) |> is_boolean() end)
    validate_options_values_are_boolean(value, length, options_without_length)
  end

  defp validate_options_values_are_boolean(false, _length, _options) do
    {:error, "Only booleans allowed for options values"}
  end

  defp validate_options_values_are_boolean(true, length, options) do
    options = included_options(options)
    invalid_options? = options |> Enum.any?(&(&1 not in @allowed_options))
    validate_options(invalid_options?, length, options)
  end

  defp included_options(options) do
    Enum.filter(options, fn{ _key, value } ->
      value |> String.trim() |> String.to_existing_atom() end)
      |> Enum.map(fn { key, _value } -> String.to_atom(key) end)
  end

end
