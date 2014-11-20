require 'rspec'

require 'card_nine/deck'
describe CardNine::Deck do
  specify {expect(described_class.new).to respond_to :cards, :pick_card}
  context 'with defaults' do
    subject{described_class.new}
    it { expect(subject.cards).to be_empty }
  end
end
