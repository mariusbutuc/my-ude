defmodule Cards do
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  defdelegate shuffle(deck), to: Enum
end
