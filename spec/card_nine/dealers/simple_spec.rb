require 'rspec'
require 'card_nine/dealers/simple'

describe CardNine::Dealers::Simple do
  let(:card_names) { %w{Batman Nightwing Batgirl Robin} }
  let(:deck) { CardNine::Deck.new(cards: card_names) }

  let(:players) { %w{Tim Dick Jason} }
  let(:locations) { { batcave: [] } }
  let(:expected_attributes) do
    {
        deck:      deck,
        locations: locations
    }
  end
  subject { CardNine::Dealers::Simple.new(deck, locations) }
  it { is_expected.to be_a described_class }
  it { is_expected.to be_a_kind_of CardNine::Dealer }
end
