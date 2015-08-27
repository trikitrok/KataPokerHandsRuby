require "./card_description"

class Card
  extend ValueObjects::ValueObject
  fields :face, :suit

  def description
    CardDescription.with(face, suit).description
  end

  def description_string
    face.description + card.suit
  end

  def <=>(other)
    return 0 if self.face.value == other.face.value
    return -1 if self.face.value > other.face.value
    return 1 if self.face.value < other.face.value
  end
end
