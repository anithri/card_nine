require 'rspec'
require 'card_nine/dealers/simple'

describe CardNine::Dealers::Simple do
  let(:card_names) { %w{Batman Nightwing Batgirl Robin} }
  let(:cards) { card_names.map { |c| CardNine::Cards::SimpleCard.new(c) } }
  let(:deck) { CardNine::Deck.new(cards: card_names) }

  let(:players) { %w{Tim Dick Jason} }
  let(:locations) { [:batcave] }
  let(:expected_attributes) {
    {
        deck:      deck,
        locations: locations
    }
  }
  subject { CardNine::Dealers::Simple.new(deck, locations) }


end