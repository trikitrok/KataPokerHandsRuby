require "./lib/value_object"
require "./card_description"

class Card
  extend ValueObjects::ValueObject
  fields :face, :suit

  def description
    CardDescription.with(face, suit).description
  end

  private
  def <=>(other)
    return self.face.compare(other.face)
  end
end
