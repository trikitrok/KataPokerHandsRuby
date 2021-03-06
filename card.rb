require "./lib/value_object"

class Card
  extend ValueObjects::ValueObject
  fields :face_value, :suit

  FACE_VALUES = ["2","3","4","5","6","7","8","9", "J","Q", "K", "A"]

  def self.create(description)
    face_value = face_value(description)
    suit = suit_descriptor(description)
    Card.new(face_value, suit)
  end

  def description
    FACE_VALUES[face_value] + suit
  end

  def <=>(other)
    return 0 if self.face_value == other.face_value
    return -1 if self.face_value > other.face_value
    return 1 if self.face_value < other.face_value
  end

  private
  def self.face_value(description)
    value_descriptor = value_descriptor(description)
    FACE_VALUES.find_index(value_descriptor)
  end
  def self.value_descriptor(description)
    String.new(description[0])
  end

  def self.suit_descriptor(description)
    String.new(description[1])
  end
end
