require "./lib/value_object"
require "./face"

class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def self.describe(face, suit)
    CardDescription.with(face, suit).description
  end

  def suit()
    description_part_for_suit()
  end

  def face()
    Face.create(description_part_for_face)
  end

  private
  def self.with(face, suit)
    card_description = face.description + suit
    CardDescription.new(card_description)
  end

  def description_part_for_face()
    String.new(description[0])
  end

  def description_part_for_suit()
    String.new(description[1])
  end
end
