require 'rspec'
require 'texas_holdem'
describe TexasHoldem, rewrite: true do
  let(:deck) { CardNine::PlayingCard.deck }
  let(:players) { %w|Barbera Dick Jason| }

  subject { TexasHoldem.shuffle(deck, players) }

  it { is_expected.to be_a CardNine::Dealer }
  it { is_expected.to have_attributes(discard: [], community: []) }
  it { expect(subject.players.keys).to eq(['Barbera', 'Dick', 'Jason']) }

end
