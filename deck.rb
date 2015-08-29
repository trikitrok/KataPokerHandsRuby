require "./card"
require "./card_description"
require "./hand_description_parser"

class Deck
  def self.draw_cards(hand_description)
    card_descriptions = parse(hand_description)
    create_cards(card_descriptions)
  end

  private
  def self.parse(hand_description)
    HandDescriptionParser.parse(hand_description)
  end

  def self.create_cards(card_descriptions)
    card_descriptions.map do |card_description|
      create_card(card_description)
    end
  end

  def self.create_card(card_description)
    card_description = CardDescription.new(card_description)
    Card.create(card_description)
  end
end
