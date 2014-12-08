require 'virtus'
require 'card_nine/deck'
require 'card_nine/table'
module CardNine
  class Hand
    include Virtus.model

    # @!attribute [rw] deck
    #   @return [CardNine::Deck]
    attribute :deck, CardNine::Deck

    # @!attribute [rw] players
    #   @return [Array]
    attribute :players, Array, default: []

    # @!attribute [rw] table
    #   @return [CardNine::Table]
    attribute :table, CardNine::Table, default: :initialize_table

    attribute :stages, Hash, default: {}

    # create a new hand, yield to a setup block if given
    def self.start(args = nil)
      hand = self.new(args)
      yield hand if block_given?
      hand
    end

    # pass deal commands to table
    # @yieldparam [Table] table for current hand
    def deal(count = 1, from: :shoe, to:)
      table.move_card(count, from: from, to: to)
    end

    def deal_players(count = 1, from: :shoe)
      count.times do
        players.each do |p|
          deal(1, from: from, to: p)
        end
      end
    end

    def discard(count = 1, from: :shoe)
      deal(count, from: from, to: :discards)
    end

    def deal_stage(stage_name = nil, &blk)
      stages[stage_name].call(self) if stage_name && stages[stage_name]
      blk.call(self) if blk
      self
    end

    # @return Array<Card> cards at +loc+ location on table
    def at(loc)
      table.at(loc)
    end

    private
    def initialize_table
      CardNine::Table.new(players: players, deck: deck)
    end
  end
end
