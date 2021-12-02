defmodule Day1 do
  def part1(file \\ "inputs/day1_part1_data.txt") do
    load(file)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end

  def part2(file \\ "inputs/day1_part2_data.txt") do
    load(file)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end

  defp load(file) do
    File.stream!(file)
    |> Stream.map(&String.to_integer(String.replace(&1, ~r{\D}, "")))
  end
end

IO.inspect(Day1.part1())
IO.inspect(Day1.part2())
