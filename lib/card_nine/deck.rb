require 'virtus'
require 'card_nine/card'
module CardNine
  class Deck
    include Virtus::Model

    # @!attribute [rw] cards
    #   @return [Array<Card>]  all of the cards in the deck, regardless of their
    #     location
    attribute :cards, Array[Card], default: ->(*args) { [] }

    # @!attribute [rw] rng
    #   @return [Random, #rand]
    attribute :rng, Random, default: ->(*args){Random.new}

    def pick_card(rng = Random.new)
      cards.sample(random: rng)
    end

    def shuffle(shuffle_rng = rng)
      cards.shuffle(random: shuffle_rng)
    end

    # useful to override adding card behavior such as to do coercion
    def add_card(card)
      cards << card
    end

    # def inspect
    #   string = "#<#{self.class.name}:#{self.object_id} >"
    # end
  end
end
