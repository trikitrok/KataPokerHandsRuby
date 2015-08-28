class Hand
  def initialize(hand_description)
    @cards = Deck.draw_cards(hand_description)
  end

  def score()
    "High card: " + highest_card().description
  end

  private
  def highest_card()
    @cards.sort().first
  end
end
