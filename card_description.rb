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

  def create_described_card()
    Card.new(face, suit)
  end

  private
  def suit()
    description_part_at(1)
  end

  def face()
    Face.create(obtain_face_description())
  end

  def obtain_face_description()
    description_part_at(0)
  end

  def description_part_at(index)
    String.new(description[index])
  end
end
