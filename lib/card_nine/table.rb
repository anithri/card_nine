require 'virtus'
module CardNine
  # a CardNine::Table is the shoe, discard pile, and player hands
  class Table
    include Virtus.model

    # @!attribute [rw] deck
    #   @return [CardNine::Deck, #shuffle]
    attribute :deck

    # @!attribute [rw] players
    #   @return [Array<Object>] all players at this table
    attribute :players, Array, default: []

    # locations as key for array of cards
    def layout
      @layout ||= init_layout
    end

    # deal move +count+ card(s) +from+ the top of one @layout location +to+ top of another
    def move_card(count = 1, from: :shoe, to:)
      layout[to].unshift(*(layout[from].shift(count)))
    end

    # return all cards at +loc+ in layout
    def at(loc)
      layout[loc]
    end

    private
    def init_layout
      l        = Hash.new { |h, k| h[k] = [] }
      l[:shoe] = self.deck.shuffle
      return l
    end

  end
end
