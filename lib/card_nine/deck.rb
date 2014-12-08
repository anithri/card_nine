module CardNine
  class Deck
    # @!method initialize(args = nil)
    #   will set the instance vars using the keys of args as a attribute name
    #   @param [Hash, Nil] args
    include Virtus.model

    # @!attribute [rw] cards
    #   @return [Array<Card>] all cards in the deck
    attribute :cards, Array[Card], default: []

    # @!attribute [rw] rng
    #   @return [Random,#rand]
    attribute :rng, Random, default: ->(*a) { Random.new }

    # @return Array[Card] randomized
    def shuffle
      cards.shuffle(random: rng)
    end
  end
end
