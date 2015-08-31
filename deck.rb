require "./card"

class Deck
  def self.draw_cards hand_description
    card_descriptions = parse(hand_description)
    create_cards(card_descriptions)
  end

  private
  FACE_VALUES = ["2","3","4","5","6","7","8","9","J","Q","K","A"]

  def self.parse hand_description
    HandDescriptionParser.parse(hand_description)
  end

  def self.create_cards card_descriptions
    card_descriptions.map do |card_description|
      create_card(card_description)
    end
  end

  def self.create_card card_description
    card_description = CardDescription.new(card_description)
    value = compute_value(card_description.face)
    Card.new(card_description.face, card_description.suit, value)
  end

  def self.compute_value face
    FACE_VALUES.find_index(face)
  end

  class CardDescription
    extend ValueObject
    fields :description

    def suit
      String.new(description[1])
    end

    def face
      String.new(description[0])
    end
  end

  class HandDescriptionParser
    def self.parse hand_description
      card_descriptions = split_in_card_descriptions(hand_description)
      check_no_repeated(card_descriptions)
      card_descriptions
    end

    private
    def self.split_in_card_descriptions hand_description
      hand_description.split(" ")
    end

    def self.check_no_repeated descriptions
      repeated = compute_repeated(descriptions)
      raise RepeatedCards.new(repeated) if not repeated.empty?
    end

    def self.compute_repeated descriptions
      descriptions.select { |token| descriptions.count(token) > 1 }.uniq
    end
  end
end
