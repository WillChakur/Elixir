defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, return the convert list" do
      expected_response = {:ok, [1, 2, "Fizz", 4, "Buzz", "FizzBuzz"]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when an invalid file is provided, returns an error" do
      expected_response = {:error, "Error reading the file"}

      assert FizzBuzz.build("invalid.txt") == expected_response
    end

  end
end
