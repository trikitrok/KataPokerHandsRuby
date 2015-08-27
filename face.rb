require "./lib/value_object"

class Face
  extend ValueObjects::ValueObject
  fields :description, :value

  def self.create(description)
    value = obtain_value(description)
    Face.new(description, value)
  end

  def compare(other)
    self <=> other
  end

  protected
  def <=>(other)
    return 0 if self.value == other.value
    return -1 if self.value > other.value
    return 1 if self.value < other.value
  end

  private
  FACE_DESCRIPTIONS = ["2","3","4","5","6","7","8","9","J","Q","K","A"]

  def self.obtain_value(description)
    FACE_DESCRIPTIONS.find_index(description)
  end
end
