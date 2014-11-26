require 'rspec'
require 'card_nine'

describe CardNine do

  subject { described_class.constants }
  it { is_expected.to include :Card, :Deck, :Dealer, :Hand }


end
