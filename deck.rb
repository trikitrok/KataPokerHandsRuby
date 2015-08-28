require "./card_description"

class Deck
  def extract_cards(hand_description)
    card_tokens = parse(hand_description)
    card_descriptions = describe(card_tokens)
    create_cards(card_descriptions)
  end

  private
  def create_cards(card_descriptions)
    card_descriptions.map do |description|
      description.create_described_card()
    end
  end

  def parse(hand_description)
    card_tokens = hand_description.split(" ")
    validate(card_tokens)
    card_tokens
  end

  def describe(cards_tokens)
    cards_tokens.map do |token|
      CardDescription.new(token)
    end
  end

  def validate(card_tokens)
    repeated = card_tokens.select { |token| card_tokens.count(token) > 1 }
    raise RepeatedCards.new(repeated.uniq) if not repeated.empty?
  end
end
