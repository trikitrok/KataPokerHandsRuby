require "./lib/value_object"
require "./deck"

class Hand
  def initialize(hand_description)
    @cards = unmarshal(hand_description)
  end

  def score()
    "High card: " + highest_card().description
  end

  protected
  def unmarshal(hand_description)
    cards_tokens = parse(hand_description)
    create(cards_tokens)
  end

  def highest_card()
    @cards.sort().first
  end

  private
  def create(card_descriptions)
    card_descriptions.map {|description| Deck.extract_card(description)}
  end

  def parse(hand_description)
    hand_description.split(" ")
  end
end
