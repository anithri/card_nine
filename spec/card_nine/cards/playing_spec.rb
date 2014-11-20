require 'rspec'

require 'card_nine/cards/playing'
describe CardNine::Cards::Playing do
  let(:title) { 'Ace of Diamonds' }
  let(:suit) { 'Diamonds' }
  let(:rank) { '1' }
  let(:name) { 'd1' }
  let(:args) { { title: title, suit: suit, rank: rank, name: name } }
  subject { described_class.new(args) }

  it { is_expected.to be_a described_class }
end
