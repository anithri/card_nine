require 'rspec'
require 'card_nine/card'

describe CardNine::Card do
  before(:all) do
    class CardKlass
      include CardNine::Card
    end
  end
  let(:name) { 'Batman' }
  let(:card_id) { :batman }

  subject { CardKlass.new(id: card_id, name: name) }
  it { is_expected.to be_a described_class }
  it { expect(subject.id).to eq :batman }
  it { expect(subject.name).to eq 'Batman' }

end
