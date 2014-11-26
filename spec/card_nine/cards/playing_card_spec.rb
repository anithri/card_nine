require 'rspec'
require 'card_nine/cards/playing_card'

describe CardNine::Cards::PlayingCard do
  let(:name) { '7 of Diamonds' }
  let(:suit) { 'Diamonds' }
  let(:rank) { '7' }
  let(:id) { '7d' }
  let(:args) { { id: id, name: name, suit: suit, rank: rank } }
  subject { described_class.new(args) }
  it { is_expected.to be_a described_class }
  it { expect(subject.id).to eq id }
  it { expect(subject.name).to eq name }
  it { expect(subject.suit).to eq suit }
  it { expect(subject.rank).to eq rank }

  describe 'sorting' do
    let(:name_h) { 'King of Spades' }
    let(:suit_h) { 'Spades' }
    let(:rank_h) { 'K' }
    let(:id_h) { 'KS' }
    let(:args_h) { { id: id_h, name: name_h, suit: suit_h, rank: rank_h } }
    let(:higher) { described_class.new(args_h) }

    it { is_expected.to respond_to :<, :> }

    it { expect(subject < higher).to be_truthy }
    it { expect(subject > higher).to be_falsey }
    it { expect(subject == higher).to be_falsey }

    let(:name_l) { '2 of Clubs' }
    let(:suit_l) { 'Clubs' }
    let(:rank_l) { '2' }
    let(:id_l) { '2C' }
    let(:args_l) { { id: id_l, name: name_l, suit: suit_l, rank: rank_l } }
    let(:lower) { described_class.new(args_l) }

    it { expect(subject < lower).to be_falsey }
    it { expect(subject > lower).to be_truthy }
    it { expect(subject == lower).to be_falsey }

    let(:same) { described_class.new(args) }

    it { expect(subject < same).to be_falsey }
    it { expect(subject > same).to be_falsey }
    it { expect(subject == same).to be_truthy }
  end
end
