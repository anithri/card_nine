require 'rspec'

require 'card_nine/deck'
require 'card_nine/cards/simple'

describe CardNine::Deck do
  let(:cards) do
    card_data = [{ name: 'foo' }, { name: 'bar' }, { name: 'baz' }]
    card_data.map { |h| CardNine::Cards::Simple.new(h) }
  end
  let(:rng) { Random.new(1234) }
  let(:args) { { rng: rng, cards: cards } }
  let(:deck) { described_class.new(args) }
  subject { described_class.new(args) }

  context 'defaults' do
    subject { described_class.new }
    it { is_expected.to be_a CardNine::Deck }
    it { expect(subject.cards).to eq([]) }
    it { expect(subject.rng).to be_a Random }
  end
  context 'with params' do
    it { is_expected.to be_a CardNine::Deck }
    it { expect(subject.cards.length).to eq(3) }
    it { expect(subject.rng).to be_a Random }
  end

  describe '.shuffle(rng = rng)' do
    it 'should call shuffle on cards array' do
      foo_bar = Random.new(2345)
      deck    = described_class.new(cards: cards, rng: foo_bar)
      expect(deck.cards).to receive(:shuffle).with(random: rng)
      deck.shuffle(rng)
    end
  end

  describe '.add_card' do
    let(:extra) { CardNine::Cards::Simple.new(name: 'woot') }
    subject do
      deck
      deck.add_card(extra)
      deck
    end
    it { expect(subject.cards.last).to eq extra }
  end

  describe '.pick_card' do
    let(:cards) { [CardNine::Cards::Simple.new(name: 'woot')] }
    it { expect(subject.pick_card).to eq cards.first }
    it 'should call sample on cards array' do
      foo_bar = Random.new(2345)
      deck    = described_class.new(cards: cards, rng: foo_bar)
      expect(deck.cards).to receive(:sample).with(random: rng)
      deck.pick_card(rng)
    end
  end
end
