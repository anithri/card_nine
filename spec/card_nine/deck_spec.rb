require 'rspec'

require 'card_nine/deck'

describe CardNine::Deck do
  let(:cards) { %w|Batman Batgirl Robin Nightwing| }
  let(:rng) { Random.new }
  subject { described_class.new(cards: cards) }
  it { is_expected.to have_attributes(cards: cards) }
  it { expect(subject.cards.length).to eq 4 }
  it { expect(subject.rng).to respond_to :rand }
  it { is_expected.to respond_to :shuffle }
  it 'should call shuffle on cards list' do
    cards = %w|Batman Batgirl Robin Nightwing|.map { |n| CardNine::Cards::SimpleCard.new(name: n) }
    rng   = Random.new(1234)
    deck  = described_class.new(rng: rng, cards: cards)
    expect(deck.cards).to receive(:shuffle!)
    deck.shuffle
  end

  describe 'defaults to' do
    subject { described_class.new }
    it { is_expected.to be_a described_class }
    it { expect(subject.cards).to eq [] }
    it { expect(subject.rng).to be_a Random }
  end

end
