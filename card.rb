class Card
  extend ValueObjects::ValueObject
  fields :face_value, :suit

  def self.value(face_descriptor)
    FACE_DESCRIPTORS.find_index(face_descriptor)
  end

  def description
    FACE_DESCRIPTORS[face_value] + suit
  end

  def <=>(other)
    return 0 if self.face_value == other.face_value
    return -1 if self.face_value > other.face_value
    return 1 if self.face_value < other.face_value
  end

  private
  FACE_DESCRIPTORS = ["2","3","4","5","6","7","8","9","J","Q","K","A"]
end
