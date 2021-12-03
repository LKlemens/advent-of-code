defmodule Day3 do
  def part1() do
    p =
      load()
      |> Enum.map(fn row ->
        row
        |> String.graphemes()
        |> Enum.map(fn x -> String.to_integer(x) end)
      end)
      |> IO.inspect()
      |> Enum.zip()
      |> Enum.map(&Tuple.to_list/1)
      |> IO.inspect()
      |> Enum.map(fn x ->
        Enum.frequencies(x)
      end)

    gamma = get_gamma(p)
    epsilon = get_epsilon(p)
    gamma * epsilon
  end

  defp get_gamma(list) do
    Enum.reduce(list, [], fn m, acc ->
      cond do
        m[0] > m[1] ->
          acc ++ [0]

        true ->
          acc ++ [1]
      end
    end)
    |> Enum.map(fn x -> Integer.to_string(x) end)
    |> List.to_string()
    |> Integer.parse(2)
    |> elem(0)
  end

  defp get_epsilon(list) do
    Enum.reduce(list, [], fn m, acc ->
      cond do
        m[0] > m[1] ->
          acc ++ [1]

        true ->
          acc ++ [0]
      end
    end)
    |> Enum.map(fn x -> Integer.to_string(x) end)
    |> List.to_string()
    |> Integer.parse(2)
    |> elem(0)
  end

  defp load(file \\ "inputs/day3_data.txt") do
    File.stream!(file)
    |> Stream.map(&String.trim(&1))
    |> Enum.to_list()
  end
end

IO.inspect(Day3.part1())
# IO.inspect(Day3.part2())
