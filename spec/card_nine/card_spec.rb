require 'rspec'
require 'card_nine/card'
require 'card_nine/face'

describe CardNine::Card do
  let(:name) { "A Card" }
  let(:front_face) { CardNine::Face.new(name: "Card")}
  let(:args) { { name: name, front_face: {name: name} } }

  subject { described_class.new(args) }

  it { is_expected.to respond_to :name, :front_face }
  it { expect(subject.name).to eq name }
  it { expect(subject.front_face).to be_a CardNine::Face }
end
