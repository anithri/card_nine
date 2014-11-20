require 'rspec'

require 'card_nine/cards/simple'
describe CardNine::Cards::Simple do
  let(:name) { 'A Card' }
  let(:args) { { name: name } }

  subject { described_class.new(args) }

  it { is_expected.to respond_to :name, :id }
  it { is_expected.to have_attributes(name: 'A Card', id: 'A Card') }

end
