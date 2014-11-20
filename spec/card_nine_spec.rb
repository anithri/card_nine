require 'rspec'
require 'card_nine'

describe CardNine do
  subject { CardNine.playing_cards }
  it { is_expected.to be_a CardNine::Deck }
  it { expect(subject.cards.length).to eq 52 }
  it { expect(subject.pick_card).to be_a CardNine::Card}

end
