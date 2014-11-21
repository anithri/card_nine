require 'rspec'
require 'card_nine/card'

describe CardNine::Card do
  before :all do
    class BlankCard
      include CardNine::Card
    end
  end
  let(:name) { 'A Card' }
  let(:id) { 'A' }
  let(:args) { { name: name, id: id } }

  subject { BlankCard.new(args) }

  it { is_expected.to respond_to :name, :id }
  it { is_expected.to have_attributes(name: 'A Card', id: 'A') }


end
