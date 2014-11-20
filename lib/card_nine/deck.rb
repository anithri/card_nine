require 'virtus'
require 'card_nine/card'
module CardNine
  class Deck
    include Virtus::Model

    # @!attribute [rw] cards
    #   @return [Array<Card>]  all of the cards in the deck, regardless of their
    #     location
    attribute :cards, Array[Cards::Playing], default: ->(*args){[]}
    # @!attribute [rw] rng
    #   @return [Random, #rand]
    attribute :rng, Random, default: ->(*args){Random.new}

    def pick_card(rng = Random.new)
      cards.sample(random: rng)
    end
  end
end
