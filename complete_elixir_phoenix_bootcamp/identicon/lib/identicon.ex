defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def save_image(binary, filename) do
    File.write("#{filename}.png", binary)
  end

  def draw_image(%Identicon.Image{colour: colour, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(colour)

    Enum.each pixel_map, fn {start, stop} ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn {_hex, index} ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}
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
