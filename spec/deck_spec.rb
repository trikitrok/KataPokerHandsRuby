require "./exceptions"
require "./deck"

describe "Deck" do
  it "never returns the same card more than twice in the same hand" do
    deck = Deck.new()

    repeated_cards = ["KC", "2H"]
    expect { deck.extract_cards("9C KC 2H 5D 2H KC") }.
      to raise_error(RepeatedCards, "Hand contains these repeated cards: " + repeated_cards.to_s)
  end
end
