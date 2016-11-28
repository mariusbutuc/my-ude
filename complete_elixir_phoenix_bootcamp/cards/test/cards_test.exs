defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_size =
      Cards.create_deck
      |> length()

    assert deck_size == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck

    refute deck == Cards.shuffle(deck)
  end
end
