require './deck'
require './hand'

describe "Hand" do
  it "scores the high card" do
    expect(hand_described_by("3D 2H 5S 9C 2D").score()).to eq("High card: 9C")
    expect(hand_described_by("2H 3D 5S 9C KD").score()).to eq("High card: KD")
  end

  def hand_described_by(hand_description)
    deck = Deck.new()
    Hand.new(deck.extract_cards(hand_description))
  end
end
