require 'card_nine/card'
module CardNine
  module Cards
    class Simple
      include Card

      attribute :id, String, default: ->(c,a){c.name}
    end
  end
end
