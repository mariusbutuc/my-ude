defmodule Cards do
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  defdelegate shuffle(deck), to: Enum
end
