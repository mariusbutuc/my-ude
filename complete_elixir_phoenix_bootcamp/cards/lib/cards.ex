defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Hearts", "Diamonds", "Clubs"]

    for suit <- suits do
      for value <- values do
        "#{value} of #{suit}"
      end
    end
    |> List.flatten
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  defdelegate shuffle(deck), to: Enum
end
