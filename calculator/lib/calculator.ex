defmodule Calculator do

  def find_percentage_of_value(percentage, value) do
    percentage
    |> BasicMath.divide(100)
    |> BasicMath.multiply(value)
  end

  def find_the_distance(speed, time) do

    speed
    |> BasicMath.multiply(time)
    |> Math.ceil()

  end

end
