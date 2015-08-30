require "./lib/value_object"
require "./face"

class CardDescription
  extend ValueObjects::ValueObject
  fields :description

  def suit()
    suit_description
  end

  def face()
    face_value = compute_face_value()
    Face.new(face_description, face_value)
  end

  private
  FACE_VALUES = ["2","3","4","5","6","7","8","9","J","Q","K","A"]

  def face_description()
    String.new(description[0])
  end

  def suit_description()
    String.new(description[1])
  end

  def compute_face_value()
    FACE_VALUES.find_index(face_description)
  end
end
