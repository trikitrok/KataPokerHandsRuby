require "./lib/value_object"

class Card
  extend ValueObjects::ValueObject
  fields :face, :suit

  def self.create(description)
    Card.new(description.face, description.suit)
  end

  def description
    face.description + suit
  end

  private
  def <=>(other)
    return 0 if self.face.value == other.face.value
    return -1 if self.face.value > other.face.value
    return 1 if self.face.value < other.face.value
  end
end
