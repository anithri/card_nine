require 'rspec'
require 'card_nine/cards/simple_card'

describe CardNine::Cards::SimpleCard do
  let(:name) { 'Batman' }
  let(:card_id) { :batman }
  subject { described_class.new(id: card_id, name: name) }
  it { is_expected.to be_a described_class }
  it { expect(subject.id).to eq :batman }
  it { expect(subject.name).to eq 'Batman' }

end
