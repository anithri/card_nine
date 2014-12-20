module CardNine
  class Table
    attr_reader :shoe, :players, :hands, :locations, :discards, :stages

    def initialize(shoe, players, locations, stages = {})
      @shoe      = shoe
      @players   = players
      @locations = locations
      @discards  = []
      @stages    = stages
      @hands     = { shoe: @shoe, discards: @discards }
      (@players + @locations).each { |l| register_loc(l) }
    end

    # @return Array all locations that cards can be dealt to
    def locs
      @hands.keys
    end

    # @param [String,Symbol] loc which location to see
    # @return Array[Card] cards for that loc
    def cards_for(loc)
      @hands[loc]
    end


    def deal(count = 1, from: :shoe, to:)
      cards_for(to).push(*cards_for(from).pop(count))
    end

    def deal_each_player(count)
      count.times { @players.each { |p| deal(to: p) } }
    end

    def deal_each_location(count)
      count.times { @locations.each { |p| deal(to: p) } }
    end

    def deal_stage(stage_name)
      @stages[stage_name].call(self)
    end

    private
    def register_loc(loc)
      @hands[loc] = []
    end
  end
end
