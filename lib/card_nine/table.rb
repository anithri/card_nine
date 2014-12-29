module CardNine
  class Table
    attr :shoe, :discards, :stages

    def initialize(shoe, locations, stages: {})
      @shoe     = shoe
      @discards = []
      @locations = locations
      @stages   = stages
      register_location(:shoe, shoe)
      register_location(:discards, @discards)
    end

    def register_location(loc_name, loc_container)
      @locations[loc_name] = loc_container
    end

    def locations
      @locations.keys
    end

    # @param [String,Symbol] loc which location to see
    # @return Array[Card] cards for that loc
    def cards_for(loc)
      @locations[loc]
    end

    def deal(count = 1, from: :shoe, to:)
      cards_for(to).push(*cards_for(from).pop(count))
    end

    def deal_each_matching(count = 1, &blk)
      count.times { match_locations(&blk).each { |p| deal(to: p) } }
    end

    def match_locations(&blk)
      locations.select { |e| blk.call(e, cards_for(e)) }
    end


  end
end
