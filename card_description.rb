require "./lib/value_object"
require "./face"

class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def suit()
    description_part_for_suit()
  end

  def face()
    Face.create(description_part_for_face)
  end

  private
  def description_part_for_face()
    String.new(description[0])
  end

  def description_part_for_suit()
    String.new(description[1])
  end
end
