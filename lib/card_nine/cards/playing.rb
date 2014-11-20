require 'card_nine/card'
module CardNine
  module Cards
    class Playing < Card
      attribute :rank, String
      attribute :suit, String
    end
  end
end
