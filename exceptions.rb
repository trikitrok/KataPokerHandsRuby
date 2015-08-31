class RepeatedCards < Exception
  def initialize repeated_cards
    super "Hand contains these repeated cards: " + repeated_cards.to_s
  end
end
