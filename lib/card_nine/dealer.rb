module CardNine
  class Dealer

    attr_reader :deck, :locations, :stages

    def initialize(deck, locations, stages = {})
      @deck      = deck
      @locations = locations
      @stages    = stages
    end

    def deal(players)
      CardNine::Table.new(deck.shuffle, players, locations, stages)
    end

  end
end
