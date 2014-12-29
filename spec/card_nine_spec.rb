require 'rspec'
require 'card_nine'
require 'card_nine/dealers/texas_holdem'
require 'card_nine/dealers/simple'
describe CardNine do

  describe 'texas holdem dealer' do
  end

  describe 'Simple dealer' do
    let(:deck) { CardNine::Deck.new(cards: %w{Batman Nightwing Batgirl Robin}) }

    let(:players) { %w{Tim Dick Jason} }
    subject { CardNine::Dealers::Simple.new(deck, { batcave: [] }) }

    it { is_expected.to be_a CardNine::Dealers::Simple }
  end
end
