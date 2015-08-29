require "./lib/value_object"

class Face
  extend ValueObjects::ValueObject
  fields :description, :value

  def self.create(description)
    value = compute_value(description)
    Face.new(description, value)
  end

  private
  FACE_DESCRIPTIONS = ["2","3","4","5","6","7","8","9","J","Q","K","A"]

  def self.compute_value(description)
    FACE_DESCRIPTIONS.find_index(description)
  end
end
