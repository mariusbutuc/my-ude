defmodule Identicon do
  def main(input) do
    input
    |> hash_input()
    |> pick_colour
  end

  def pick_colour(image) do
    %Identicon.Image{
      hex: [red_hex, green_hex, blue_hex | _tail ]
    } = image

    [red_hex, green_hex, blue_hex]
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
