require "./card"

class Deck
  def self.extract_card(description)
    face_value = obtain_face_value(description)
    suit = obtain_suit(description)
    Card.new(face_value, suit)
  end

  private
  def self.obtain_face_value(description)
    description.face_value()
  end

  def self.obtain_suit(description)
    description.suit
  end
end
