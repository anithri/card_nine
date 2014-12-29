require 'rspec'
require 'card_nine/table'

describe CardNine::Table do
  let(:card_names) { %w{Zorro Batman Batgirl Robin} }
  let(:shoe) { CardNine::Deck.new(cards: card_names).cards }
  let(:locations) do
    h            = {}
    h[:batplane] = []
    h
  end
  subject { described_class.new(shoe, locations) }

  it { is_expected.to be_a described_class }
  it { expect(subject.locations).to eq [:batplane, :shoe, :discards] }

  describe 'easy stuff' do
    it 'returns the container for a given location' do
      subject.register_location(:tim, :drake_manor)
      expect(subject.cards_for(:tim)).to eq :drake_manor
    end
    it 'registers locations' do
      subject.register_location(:tim, [:drake_manor])
      expect(subject.cards_for(:tim)).to eq [:drake_manor]
    end
    it 'reports locations' do
      subject.register_location(:tim, [:drake_manor])
      expect(subject.locations).to eq [:batplane, :shoe, :discards, :tim]
    end
  end

  describe '.deal(count = 1, from: :shoe, to:' do
    context 'with default count' do
      subject do
        s = described_class.new(shoe, locations)
        s.deal(to: :batplane)
        s
      end
      it { expect(subject.shoe.count).to eq 3 }
      it { expect(subject.cards_for(:batplane).first).to eq 'Robin' }
    end
    context 'with given count' do
      subject do
        s = described_class.new(shoe, locations)
        s.deal(2, to: :batplane)
        s
      end
      it { expect(subject.shoe.count).to eq 2 }
      it { expect(subject.cards_for(:batplane).first).to eq 'Batgirl' }
      it { expect(subject.cards_for(:batplane).last).to eq 'Robin' }
    end
  end
  describe '.deal_each_matching(count = 1){|location, container|}' do
    context 'with default count' do
      subject do
        locations['Alfred'] = []
        locations['James']  = []
        s                   = described_class.new(shoe, locations)
        s.deal_each_matching { |location, container| location.is_a? String }
        s
      end
      it { expect(subject.shoe.count).to eq 2 }
      it { expect(subject.cards_for('Alfred').first).to eq 'Robin' }
      it { expect(subject.cards_for('James').first).to eq 'Batgirl' }
      it { expect(subject.discards).to eq [] }
      it { expect(subject.cards_for(:batplane)).to eq [] }

    end
    context 'with given count' do
      subject do
        s = described_class.new(shoe, locations)
        s.deal_each_matching(2) { |l, c| l.is_a?(Symbol) && l != :shoe }
        s
      end
      it { expect(subject.shoe.count).to eq 0 }
      it { expect(subject.cards_for(:discards)).to eq ['Batgirl', 'Zorro'] }
      it { expect(subject.cards_for(:batplane)).to eq ['Robin', 'Batman'] }
    end
  end
end


