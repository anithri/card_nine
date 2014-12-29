module CardNine
  class Dealer

    # @!attribute [rw] deck
    #   @return [CardNine::Deck]
    # @!attribute [rw] locations
    #   @return [Array<Symbol>]
    # @!attribute [rw] players
    #   @return [Hash<Symbol => Proc>]
    attr_reader :deck, :locations, :stages

    # @param [CardNine::Deck] deck
    # @param [Array<Symbol>] locations
    # @param [stages]
    def initialize(deck, locations, stages = {})
      @deck      = deck
      @locations = locations
      @stages    = stages
    end

    # Create a CardNine::Table
    # @param [Array<String,Object>] players
    # @return [CardNine::Table] using deck, players, locations and stages
    def deal(players)
      CardNine::Table.new(deck.shuffle, players, locations, stages)
    end
  end
end
