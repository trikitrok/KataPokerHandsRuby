class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def self.from_card(card)
    card_description = face_description_of(card) + card.suit
    CardDescription.new(card_description)
  end

  def suit()
    String.new(description[1])
  end

  def face_value()
    FACE_DESCRIPTIONS.find_index(face_description)
  end

  private
  FACE_DESCRIPTIONS = ["2","3","4","5","6","7","8","9","J","Q","K","A"]

  def face_description()
    String.new(description[0])
  end

  def self.face_description_of(card)
    FACE_DESCRIPTIONS[card.face_value]
  end
end
