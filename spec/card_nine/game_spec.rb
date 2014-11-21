require 'rspec'

require 'card_nine'
require 'card_nine/game'
describe CardNine::Game do
  let(:deck) { CardNine.playing_cards }
  let(:rng) { Random.new(1234) }

  subject { described_class.new(source_deck: deck, rng: rng) }

  it { is_expected.to be_a described_class }
  it { is_expected.to respond_to :shuffle }

  describe 'shuffle' do
    let(:game) { described_class.new(source_deck: deck) }
    it { is_expected.to be_a described_class }
    it 'should call shuffle on source_deck' do
      expect(subject.source_deck).to receive(:shuffle)
      subject.shuffle
    end
  end

  context 'with defaults' do
    subject { described_class.new }
    it { is_expected.to be_a described_class }
    it { expect(subject.discard).to eq [] }
    it { expect(subject.source_deck).to be_a CardNine::Deck }
    it { expect(subject.source_deck.cards).to eq [] }
    it { expect(subject.rng).to be_a Random }
  end

  describe 'deal_card_to(hand)' do

  end

end
