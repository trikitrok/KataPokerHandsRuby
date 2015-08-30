require "./lib/value_object"

class Face
  extend ValueObjects::ValueObject
  fields :description, :value
end
