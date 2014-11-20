require 'card_nine/card'
module CardNine
  module Cards
    class Playing
      include CardNine::Card

      attribute :suit, String
      attribute :rank, String
      attribute :name, String, default: ->(p, c) { "#{p.rank} of #{p.suit}" }
      attribute :id, String
    end
  end
end
