require 'rspec'
require 'card_nine/table'

describe CardNine::Table do
  let(:card_names) { %w{Batman Nightwing Batgirl Robin} }
  let(:cards) { card_names.map { |c| CardNine::Cards::SimpleCard.new(c) } }
  let(:shoe) { CardNine::Deck.new(cards: card_names).cards }

  let(:players) { %w{Tim Dick Jason} }
  let(:locations) { [:batcave] }
  let(:expected_locs) { [:shoe, :discards] + locations + players }
  let(:expected_attributes) {
    {
        shoe:      shoe,
        players:   players,
        locations: locations,
        stages:    {}
    }
  }
  subject { CardNine::Table.new(shoe, players, locations) }

  it { is_expected.to be_a CardNine::Table }
  it { is_expected.to have_attributes expected_attributes }
  it { expect(subject.locs).to include *expected_locs }
  it { expect(subject.discards).to eq [] }
  it { expect(subject.cards_for(:batcave)).to eq [] }
  it { expect(subject.cards_for('Tim')).to eq [] }

  describe '.deal(count = 1, to:)' do
    let(:table) { CardNine::Table.new(shoe, players, locations) }
    subject { table.deal(to: :batcave); table }
    it { expect(subject.cards_for(:batcave)).to eq ['Robin'] }
    it { expect(subject.shoe).to eq %w{Batman Nightwing Batgirl } }
    context 'with a count of 2' do
      subject { table.deal(2, to: :batcave); table }
      it { expect(subject.cards_for(:batcave)).to eq ['Batgirl', 'Robin'] }
      it { expect(subject.shoe).to eq ['Batman', 'Nightwing'] }
    end
    context 'with a from location' do
      subject do
        table.deal(2, to: :batcave)
        table.deal(from: :batcave, to: 'Tim')
        table
      end
      it { expect(subject.cards_for(:batcave)).to eq ['Batgirl'] }
      it { expect(subject.cards_for('Tim')).to eq ['Robin'] }
    end
  end

  describe '.deal_each_player(grp, count)' do
    let(:table) { CardNine::Table.new(shoe, players, locations) }
    subject do
      table.deal_each_player(1)
      table
    end
    it { expect(subject.shoe).to eq ['Batman'] }
    it { expect(subject.cards_for('Tim')).to eq ['Robin'] }

    context 'with a count over 1' do
      let(:card_names) { %w{Batman Nightwing Batgirl Robin Spoiler Huntress} }
      subject { table.deal_each_player(2); table }
      it { expect(subject.shoe).to eq [] }
      it { expect(subject.cards_for('Dick')).to eq ['Spoiler', 'Nightwing'] }
    end
  end

  describe '.deal_stage(stage_name)' do
    it 'should yield to the named proc' do
      canary = double('canary')
      expect(canary).to receive(:call)
      stages = { deal_1: canary }
      table  = CardNine::Table.new(shoe, players, locations, stages)
      table.deal_stage(:deal_1)
    end

  end


end
