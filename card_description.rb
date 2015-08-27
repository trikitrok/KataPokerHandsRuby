require "./card"
require "./lib/value_object"
require "./face"

class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def self.with(face, suit)
    card_description = face.description + suit
    CardDescription.new(card_description)
  end

  def create_matching_card()
    Card.new(face, suit)
  end

  private
  def suit()
    String.new(description[1])
  end

  def face()
    face_description = obtain_face_description()
    Face.create(face_description)
  end

  def obtain_face_description()
    String.new(description[0])
  end
end
