require "./spec/custom_matchers"
require "./exceptions"
require './hand'

describe "Hand" do
  it "scores the high card" do
    expect(hand_described_by("3D 2H 5S 9C 2D")).to score("High card: 9C")
    expect(hand_described_by("2H 3D 5S 9C KD")).to score("High card: KD")
  end

  it "never contains a repeated card" do
    repeated_cards = ["KC", "2H"]
    expect do
      hand_described_by("9C KC 2H 5D 2H KC")
    end.to raise_error(
      RepeatedCards, "Hand contains these repeated cards: " + repeated_cards.to_s
    )
  end

  def hand_described_by(hand_description)
    Hand.new(hand_description)
  end
end
