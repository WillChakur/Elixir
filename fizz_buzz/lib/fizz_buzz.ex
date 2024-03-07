defmodule FizzBuzz do

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(fn x -> String.to_integer(x) end)
      |> fizz_buzz()

    {:ok, result}
  end
  defp handle_file_read({:error, _reason}), do: {:error, "Error reading the file"}

  #Method that I coded
  defp fizz_buzz(l) do
    Enum.map(l, fn x ->
      case ({rem(x, 3), rem(x, 5)}) do
        {0, 0} -> "FizzBuzz"
        {0, _} -> "Fizz"
        {_, 0} -> "Buzz"
        _ -> x
      end
    end)
  end


  #Method using guards
  # defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: "FizzBuzz"
  # defp evaluate_numbers(number) when rem(number, 3) == 0, do: "Fizz"
  # defp evaluate_numbers(number) when rem(number, 5) == 0, do: "Buzz"
  # defp evaluate_numbers(number), do: number

end
