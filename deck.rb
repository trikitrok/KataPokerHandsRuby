require "./card"
require "./card_description"

class Deck
  def self.draw_cards(hand_description)
    card_tokens = parse(hand_description)
    card_descriptions = describe(card_tokens)
    create_cards(card_descriptions)
  end

  private
  def self.create_cards(card_descriptions)
    card_descriptions.map do |description|
      Card.create(description)
    end
  end

  def self.parse(hand_description)
    card_tokens = hand_description.split(" ")
    validate(card_tokens)
    card_tokens
  end

  def self.describe(cards_tokens)
    cards_tokens.map do |token|
      CardDescription.new(token)
    end
  end

  def self.validate(card_tokens)
    repeated = repeated_cards(card_tokens)
    raise RepeatedCards.new(repeated) if not repeated.empty?
  end

  def self.repeated_cards(card_tokens)
    card_tokens.select { |token| card_tokens.count(token) > 1 }.uniq
  end
end
