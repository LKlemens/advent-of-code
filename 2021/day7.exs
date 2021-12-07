defmodule Day7 do
  def part1() do
    load()
    |> find()
    |> Enum.min()
  end

  def find(l) do
    min = Enum.min(l)
    max = Enum.max(l)

    Enum.map(min..max, fn c -> l |> Enum.map(&abs(c - &1)) |> Enum.sum() end)
  end

  defp load(file \\ "inputs/day7_data.txt") do
    File.read!(file)
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer(&1))
  end
end

IO.inspect(Day7.part1())
