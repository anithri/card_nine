require 'rspec'
require 'card_nine/hand'

describe CardNine::Hand do
  let(:players) { %w|Batman Batgirl Robin| }
  let(:deck) { CardNine::Cards::PlayingCard.deck }
  let(:table) { CardNine::Table.new(players: players, deck: deck) }
  let(:stages) { { deal_five: ->(h) { h.deal_players(5) } } }
  let(:args) { { players: players, deck: deck } }
  subject { described_class.new(args) }
  it { is_expected.to be_a described_class }

  it { expect(subject.deck).to eq deck }
  it { expect(subject.players).to eq players }
  it { expect(subject.table).to be_a CardNine::Table }
  it { expect(subject.stages).to be_a Hash }

  describe '#start(args = nil, &blk)' do
    it { expect(described_class.start(args)).to be_a described_class }
    it 'executes block with hand as argument' do
      hand = described_class.start(args) { |h| h.players << 'Nightwing' }
      expect(hand.players).to include 'Nightwing'
    end
  end

  describe '.at(loc)' do
    subject { described_class.start(args) }
    it { is_expected.to be_a described_class }
    it { expect(subject.at(:shoe).length).to eq 52 }
    it { expect(subject.at(:discards)).to eq [] }
  end

  describe '.deal_stage(stage_name = nil, &blk)' do

    context 'with only block' do
      subject do
        h = described_class.start(players: players, deck: deck, table: table, stages: stages)
        h.deal_stage do |h|
          h.deal(3, to: :discards)
        end
        h
      end
      it { expect(subject.at(:discards).length).to eq 3 }

    end

    context 'with only stage' do
      subject do
        h = described_class.start(players: players, deck: deck, table: table, stages: stages)
        h.deal_stage(:deal_five)
        h
      end
      it { expect(subject.at('Batman').length).to eq 5 }
      it { expect(subject.at('Batgirl').length).to eq 5 }
      it { expect(subject.at('Robin').length).to eq 5 }
    end
    context 'with both stages and block' do
      subject do
        h = described_class.start(players: players, deck: deck, table: table, stages: stages)
        h.deal_stage(:deal_five) { |h| h.deal(6, to: :discards) }
        h
      end
      it { expect(subject.at('Batman').length).to eq 5 }
      it { expect(subject.at('Batgirl').length).to eq 5 }
      it { expect(subject.at('Robin').length).to eq 5 }
      it { expect(subject.at(:discards).length).to eq 6 }
      it { expect(subject.at(:shoe).length).to eq 31 }


    end

  end


end
