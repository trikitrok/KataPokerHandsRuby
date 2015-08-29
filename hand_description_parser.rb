require "./exceptions"

class HandDescriptionParser
  def self.parse(hand_description)
    card_descriptions = split_in_card_descriptions(hand_description)
    check_no_repeated(card_descriptions)
    card_descriptions
  end

  private
  def self.split_in_card_descriptions(hand_description)
    hand_description.split(" ")
  end

  def self.check_no_repeated(descriptions)
    repeated = compute_repeated(descriptions)
    raise RepeatedCards.new(repeated) if not repeated.empty?
  end

  def self.compute_repeated(descriptions)
    descriptions.select { |token| descriptions.count(token) > 1 }.uniq
  end
end
