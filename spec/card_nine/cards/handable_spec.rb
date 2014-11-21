require 'rspec'

require 'card_nine/cards/handable'
describe CardNine::Cards::Handable do
  before :all do
    class FakeHand
      include CardNine::Card
      include CardNine::Cards::Handable
    end
  end
  context 'with defaults' do
    subject { FakeHand.new }
    it { is_expected.to be_a described_class }
    it { expect(subject.players).to eq [] }
    it { expect(subject.hands).to eq({}) }
  end

  context 'given players' do
    let(:players) { ['Bruce', 'Barbara', 'Dick'] }
    subject { FakeHand.new(players: players) }
    it { expect(subject.players).to eq players }
    it { expect(subject.hands.keys).to eq players }
  end

  describe '.player_hand(player_name)' do
    let(:players) { ['Bruce', 'Barbera', 'Dick'] }
    let(:args) { { players: players } }
    let(:fake) { FakeHand.new(args) }

    context 'with existing player' do
      subject { fake.player_hand('Bruce') }
      it { is_expected.to eq [] }
    end

    context 'with no player' do
      subject { fake.player_hand(:doh) }

      it { is_expected.to eq nil }
    end
  end

end

