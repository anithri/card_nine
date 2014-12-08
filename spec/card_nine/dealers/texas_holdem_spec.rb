require 'rspec'
require 'card_nine/dealers/texas_holdem'

describe CardNine::Dealers::TexasHoldem do
  let(:players) { %w|Barbera Stephanie Cassandra| }

  subject { described_class.new(players: players) }

  it { is_expected.to be_a described_class }
  it { is_expected.to respond_to :new_hand }

  describe '.new_hand' do
    subject { described_class.new(players: players).new_hand }
    it { is_expected.to be_a CardNine::Hand }
  end

  describe 'STAGES' do
    context ':hole_cards' do
      subject do
        h = described_class.new(players: players).new_hand
        h.deal_stage(:deal_hole_cards)
        h
      end
      it { is_expected.to be_a CardNine::Hand }
      it { expect(subject.at('Barbera').length).to eq 2 }
      it { expect(subject.at('Stephanie').length).to eq 2 }
      it { expect(subject.at('Cassandra').length).to eq 2 }
      it { expect(subject.at(:discards)).to be_empty }
      it { expect(subject.at(:shoe).length).to eq 46 }
    end

    context ':flop' do
      subject do
        h = described_class.new(players: players).new_hand
        h.deal_stage(:flop)
        h
      end
      it { is_expected.to be_a CardNine::Hand }
      it { expect(subject.at(:community).length).to eq 3 }
      it { expect(subject.at(:discards).length).to eq 1 }
      it { expect(subject.at(:shoe).length).to eq 48 }
    end

    context ':turn' do
      subject do
        h = described_class.new(players: players).new_hand
        h.deal_stage(:turn)
        h
      end
      it { is_expected.to be_a CardNine::Hand }
      it { expect(subject.at(:community).length).to eq 1 }
      it { expect(subject.at(:discards).length).to eq 1 }
      it { expect(subject.at(:shoe).length).to eq 50 }
    end

    context ':river' do
      subject do
        h = described_class.new(players: players).new_hand
        h.deal_stage(:river)
        h
      end
      it { is_expected.to be_a CardNine::Hand }
      it { expect(subject.at(:community).length).to eq 1 }
      it { expect(subject.at(:discards).length).to eq 1 }
      it { expect(subject.at(:shoe).length).to eq 50 }
    end

    context 'all in order' do
      subject do
        h = described_class.new(players: players).new_hand
        h.deal_stage(:deal_hole_cards)
        h.deal_stage(:flop)
        h.deal_stage(:turn)
        h.deal_stage(:river)
        h
      end
      it { is_expected.to be_a CardNine::Hand }
      it { expect(subject.at('Barbera').length).to eq 2 }
      it { expect(subject.at('Stephanie').length).to eq 2 }
      it { expect(subject.at('Cassandra').length).to eq 2 }
      it { expect(subject.at(:community).length).to eq 5 }
      it { expect(subject.at(:discards).length).to eq 3 }
      it { expect(subject.at(:shoe).length).to eq 38 }


    end
  end

end
