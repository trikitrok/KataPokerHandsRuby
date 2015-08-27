require "./lib/value_object"
require "./card_description"
require "./deck"

class Hand
  def initialize(cards)
    @cards = cards
  end

  def score()
    "High card: " + highest_card().description
  end

  private
  def highest_card()
    @cards.sort().first
  end
end
