require 'rspec'
require 'card_nine'

describe CardNine do
  describe 'get a simple card' do
    subject { CardNine::Cards::Simple.new(name: 'CardNine') }
    it { is_expected.to be_a CardNine::Cards::Simple }
    it { is_expected.to have_attributes(name: 'CardNine', id: 'CardNine') }
  end

  subject { CardNine.playing_cards }
  it { is_expected.to be_a CardNine::Deck }
  it { expect(subject.cards.length).to eq 52 }
  it { expect(subject.pick_card).to be_a_kind_of CardNine::Cards::Playing}

end
