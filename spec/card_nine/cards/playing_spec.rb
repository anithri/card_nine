require 'rspec'

require 'card_nine/cards/playing'
describe CardNine::Cards::Playing do
  let(:title) { 'Ace of Diamonds' }
  let(:suit) {'Diamonds'}
  let(:rank) {'Ace'}
  let(:id) {'AD'}
  let(:args) { { id: id, title: title, suit: suit, rank: rank} }
  subject { described_class.new(args) }

  it { is_expected.to be_a described_class }
  it { is_expected.to have_attributes(name: title, id: 'AD', suit: 'Diamonds', rank: 'Ace') }

end
