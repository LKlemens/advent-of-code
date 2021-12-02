defmodule Day2 do
  def part1() do
    load()
    |> Enum.reduce(%{"horizontal" => 0, "depth" => 0}, fn row, acc ->
      cond do
        row =~ "forward" ->
          Map.update(acc, "horizontal", 0, fn val -> val + get_num(row) end)

        row =~ "down" ->
          Map.update(acc, "depth", 0, fn val -> val + get_num(row) end)

        true ->
          Map.update(acc, "depth", 0, fn val -> val - get_num(row) end)
      end
    end)
    |> Enum.reduce(1, fn {_, y}, acc -> acc * y end)
  end

  def part2() do
    load()
    |> Enum.reduce(%{"horizontal" => 0, "depth" => 0, "aim" => 0}, fn row, acc ->
      cond do
        row =~ "forward" ->
          acc
          |> Map.update("horizontal", 0, fn val -> val + get_num(row) end)
          |> Map.update("depth", 0, fn val -> val + acc["aim"] * get_num(row) end)

        row =~ "down" ->
          Map.update(acc, "aim", 0, fn val -> val + get_num(row) end)

        true ->
          Map.update(acc, "aim", 0, fn val -> val - get_num(row) end)
      end
    end)
    |> Map.delete("aim")
    |> Enum.reduce(1, fn {_, y}, acc -> acc * y end)
  end

  defp get_num(row) do
    row
    |> String.replace(~r{\D}, "")
    |> String.to_integer()
  end

  defp load(file \\ "inputs/day2_data.txt") do
    File.stream!(file)
    |> Stream.map(&String.trim(&1))
    |> Enum.to_list()
  end
end

IO.inspect(Day2.part1())
IO.inspect(Day2.part2())
