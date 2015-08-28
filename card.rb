require "./lib/value_object"
require "./card_description"

class Card
  extend ValueObjects::ValueObject
  fields :face, :suit

  def self.create(description)
    Card.new(description.face, description.suit)
  end

  def description
    CardDescription.describe(face, suit)
  end

  private
  def <=>(other)
    return self.face.compare(other.face)
  end
end
