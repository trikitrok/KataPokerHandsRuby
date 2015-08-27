require "./card"

class Deck
  def extract_cards(hand_description)
    card_tokens = parse(hand_description)
    card_descriptions = describe(card_tokens)
    create_cards(card_descriptions)
  end

  private
  def create_cards(card_descriptions)
    card_descriptions.map do |description|
      description.create_matching_card()
    end
  end

  def parse(hand_description)
    hand_description.split(" ")
  end

  def describe(cards_tokens)
    cards_tokens.map do |token|
      CardDescription.new(token)
    end
  end
end
