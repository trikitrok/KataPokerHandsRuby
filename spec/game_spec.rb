require './game'

describe "The Poker Hands" do
  it "scores the high card" do
    expect(Hand.new("3D 2H 5S 9C 2D").score()).to eq("High card: 9C")
    expect(Hand.new("2H 3D 5S 9C KD").score()).to eq("High card: KD")
  end
end
