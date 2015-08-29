require "./card"
require "./card_description"

class Deck
  def self.draw_cards(hand_description)
    card_tokens = parse(hand_description)
    create_cards(card_tokens)
  end

  private
  def self.create_cards(cards_tokens)
    cards_tokens.map do |token|
      create_card(token)
    end
  end

  def self.create_card(card_token)
    description = CardDescription.new(card_token)
    Card.create(description)
  end

  def self.parse(hand_description)
    card_tokens = hand_description.split(" ")
    validate(card_tokens)
    card_tokens
  end

  def self.validate(card_tokens)
    repeated = repeated_cards(card_tokens)
    raise RepeatedCards.new(repeated) if not repeated.empty?
  end

  def self.repeated_cards(card_tokens)
    card_tokens.select { |token| card_tokens.count(token) > 1 }.uniq
  end
end
