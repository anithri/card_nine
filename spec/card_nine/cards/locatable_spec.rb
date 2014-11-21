require 'rspec'

require 'card_nine/cards/locatable'
describe CardNine::Cards::Locatable do
  before :all do
    class FakeLocation
      include CardNine::Card
      include CardNine::Cards::Locatable

      def default_areas;
        ['foo'];
      end
    end
  end
  context 'with defaults' do
    subject { FakeLocation.new }
    it { is_expected.to be_a described_class }
    it 'will have defaults' do
      expect(subject).to have_attributes(
                             areas: ['foo'],
                             piles: { 'foo' => [] },
                         )
    end
  end

  context 'with values' do
    let(:areas) { [:community] }
    let(:args) { { areas: areas } }
    subject { FakeLocation.new(args) }
    it { is_expected.to be_a described_class }
    it 'will have defaults' do
      expect(subject).to have_attributes(
                             areas: [:community],
                             piles: { community: [] },
                         )
    end
  end

  describe '.location_area(location_name)' do
    let(:areas) { [:community, :discard] }
    let(:args) { { areas: areas } }
    let(:fake) { FakeLocation.new(args) }

    context 'with existing location' do
      subject { fake.area_pile(:community) }

      it { is_expected.to eq [] }
    end

    context 'with no location' do
      subject { fake.area_pile(:doh) }

      it { is_expected.to eq nil }
    end
  end
end
