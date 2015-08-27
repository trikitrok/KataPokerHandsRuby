require "./card"

class Deck
  def self.extract_card(description)
    face_value = face_value(description)
    suit = suit_descriptor(description)
    Card.new(face_value, suit)
  end

  private
  def self.face_value(description)
    face_descriptor = face_descriptor(description)
    Card.value(face_descriptor)
  end

  def self.face_descriptor(description)
    String.new(description[0])
  end

  def self.suit_descriptor(description)
    String.new(description[1])
  end
end
