require "./lib/value_object"
require "./face"

class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def self.describe(face, suit)
    CardDescription.with(face, suit).description
  end

  def suit()
    description_part_at(1)
  end

  def face()
    Face.create(face_description())
  end

  private
  def self.with(face, suit)
    card_description = face.description + suit
    CardDescription.new(card_description)
  end

  def face_description()
    description_part_at(0)
  end

  def description_part_at(index)
    String.new(description[index])
  end
end
