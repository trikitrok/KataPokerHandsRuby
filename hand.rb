require "./lib/value_object"
require "./card_description"
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
    card_tokens = parse(hand_description)
    card_descriptions = describe(card_tokens)
    create(card_descriptions)
  end

  def highest_card()
    @cards.sort().first
  end

  private
  def create(card_descriptions)
    card_descriptions.map do |description|
      Deck.extract_card(description)
    end
  end

  def parse(hand_description)
    hand_description.split(" ")
  end

  def describe(cards_tokens)
    cards_tokens.map { |token| CardDescription.new(token) }
  end
end
