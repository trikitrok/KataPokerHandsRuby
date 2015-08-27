require "./card_description"

class Card
  extend ValueObjects::ValueObject
  fields :face_value, :suit

  def description
    CardDescription.from_card(self).description
  end

  def <=>(other)
    return 0 if self.face_value == other.face_value
    return -1 if self.face_value > other.face_value
    return 1 if self.face_value < other.face_value
  end
end
