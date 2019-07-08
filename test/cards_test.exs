defmodule CardsTest do
  use ExUnit.Case, async: true

  doctest Cards

  describe "#shuffle" do
    test "shuffling a deck randomizes it" do
      deck = Cards.create_deck
      refute deck == Cards.shuffle(deck)
    end
  end

  describe "#contains?" do
    test "check if a deck contains card" do
      deck = Cards.create_deck
      assert true == Cards.contains?(deck, "Ace of Spades")
    end
  end

  describe "#deal" do
    test "divides deck into hand of given size" do
      expected = {
        ["Ace of Spades"],
        [
          "Two of Spades", "Three of Spades", "Four of Spades",
          "Five of Spades", "Ace of Clubs", "Two of Clubs",
          "Three of Clubs", "Four of Clubs", "Five of Clubs",
          "Ace of Hearts", "Two of Hearts", "Three of Hearts",
          "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
          "Two of Diamonds", "Three of Diamonds", "Four of Diamonds",
          "Five of Diamonds"
        ]
      }

      deck = Cards.create_deck
      assert expected == Cards.deal(deck, 1)
    end
  end
end
