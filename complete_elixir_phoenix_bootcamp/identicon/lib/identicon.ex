defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
    |> filter_odd_squares
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    coloured_cells =
      grid
      |> Enum.filter(fn {hex_code, _} -> rem(hex_code, 2) == 0 end)

    %Identicon.Image{image | grid: coloured_cells}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row([first, second | _] = row) do
    row ++ [second, first]
  end

  def pick_colour(
    %Identicon.Image{hex: [red_hex, green_hex, blue_hex | _tail ]} = image
  ) do
    %Identicon.Image{image | colour: {red_hex, green_hex, blue_hex}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
