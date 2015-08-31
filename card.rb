require "value_object"

class Card
  extend ValueObject
  fields :face, :suit, :value

  def description
    face + suit
  end

  private
  def <=> other
    return 0 if self.value == other.value
    return -1 if self.value > other.value
    return 1 if self.value < other.value
  end
end
