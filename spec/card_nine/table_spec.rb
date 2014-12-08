require 'rspec'
require 'card_nine/table'

describe CardNine::Table do
  let(:cards) do
    %w|Batman Batgirl Robin Nightwing|.
        map { |n| CardNine::Cards::SimpleCard.new(name: n) }
  end
  let(:deck) { CardNine::Deck.new(cards: cards) }
  subject { described_class.new(deck: deck) }
  it { is_expected.to be_a described_class }
  it { expect(subject.deck).to eq deck }
  it { expect(subject.players).to eq [] }
  it { expect(subject.layout).to be_a Hash }
  it { expect(subject.layout[:shoe].length).to eq 4 }
  it { expect(subject.layout[:discards]).to eq [] }
  describe '.move_card(from: old_pile, to: new_pile)' do
    context 'using default count and :from' do
      subject do
        table = described_class.new(deck: deck, players: %w|Jason Tim|)
        table.move_card(to: 'Tim')
        table.move_card(to: 'Jason')
        table.move_card(to: :discards)
        table
      end

      it { is_expected.to be_a CardNine::Table }

      it 'moves each card to the right spot' do
        expect(subject.at('Tim').length).to eq 1
        expect(subject.at('Jason').length).to eq 1
        expect(subject.at(:shoe).length).to eq 1
        expect(subject.at(:discards).length).to eq 1

      end

    end
    context 'with count' do
      subject do
        table = described_class.new(deck: deck, players: %w|Jason Tim|)
        table.move_card(2, to: 'Tim')
        table.move_card(2, to: 'Jason')
        table
      end

      it { is_expected.to be_a CardNine::Table }

      it 'moves each card to the right spot' do
        expect(subject.at('Tim').length).to eq 2
        expect(subject.at('Jason').length).to eq 2
        expect(subject.at(:shoe).length).to eq 0
        expect(subject.at(:discards).length).to eq 0
      end
    end
    context 'with count' do
      subject do
        table = described_class.new(deck: deck, players: %w|Jason Tim|)
        table.move_card(4, to: 'Tim')
        table.move_card(2, to: 'Jason', from: 'Tim')
        table
      end

      it { is_expected.to be_a CardNine::Table }

      it 'moves each card to the right spot' do
        expect(subject.at('Tim').length).to eq 2
        expect(subject.at('Jason').length).to eq 2
        expect(subject.at(:shoe).length).to eq 0
        expect(subject.at(:discards).length).to eq 0
      end
    end

  end
end
