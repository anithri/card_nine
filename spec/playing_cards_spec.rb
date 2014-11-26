require 'rspec'
#require 'card_nine/playing_card'

describe CardNine::PlayingCard, rewrite: true do
  describe '.deck' do
    subject { described_class.deck }

    it { is_expected.to be_a CardNine::Deck }
    it { expect(subject.cards.length).to eq 52 }
    it { expect(subject.cards['4D'].suit).to eq 'Diamonds' }
    it { expect(subject.cards['AH'].rank).to eq 'Ace' }
    it { expect(subject.cards['JC'].name).to eq 'Jack of Clubs' }
  end

end
