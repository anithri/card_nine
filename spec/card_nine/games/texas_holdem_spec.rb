require 'rspec'

require 'card_nine/games/texas_holdem'
describe CardNine::Games::TexasHoldem do
  context 'with defaults' do
    subject { described_class.new }
    it { is_expected.to be_a described_class }
    it { expect(subject.source_deck).to be_a CardNine::Deck }
    it { expect(subject.players).to eq [] }
    it { expect(subject.hands).to eq({}) }
    it { expect(subject.areas).to eq [:community] }
    it { expect(subject.piles).to eq({ community: [] }) }
    it { expect(subject.rng).to be_a Random }
  end

  describe '.deal' do
    let(:players) { %w|Bruce Barbera Dick| }
    subject { described_class.new(players: players) }

    it 'expect it to call init_hands', focus: true do
      expect(subject).to receive(:init_hands)
      subject.deal
    end

    it 'expect it to call init_piles' do
      expect(subject).to receive(:init_piles)
      subject.deal
    end

    it 'expect it to call deal_card_to' do
      expect(subject).to receive(:deal_card_to).exactly(6).times
      subject.deal
    end

  end

end
