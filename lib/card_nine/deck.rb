require 'virtus'
module CardNine
  class Deck
    include Virtus.model

    # @!attribute [rw] cards
    #   @return [Array<CardNine::Card>]
    attribute :cards, Array, default: []

    # @!attribute [rw] rng
    #   @return [Random,#rand]
    attribute :rng, Random, default: ->(*a) { Random.new }

    # @return Array[Card] randomized
    def shuffle
      cards.shuffle!(random: rng)
    end
  end
end
