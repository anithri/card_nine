require 'card_nine/card'
require 'card_nine/deck'

module CardNine
  module Cards
    # A class that represents the typical playing card from a 52 card deck.
    class PlayingCard
      # @note implements comparable
      include Comparable

      # @!method initialize(args = nil)
      #   will set the instance vars using the keys of args as a attribute name
      #   @param [Hash, Nil] args
      include CardNine::Card

      # ALL Suits of cards
      SUITS = %w|Clubs Hearts Diamonds Spades|.freeze
      # All Ranks of cards
      RANKS = %w|2 3 4 5 6 7 8 9 10 Jack Queen King Ace|.freeze

      # @!attribute [rw] suit
      #   @return [String] suit of card
      attribute :suit, String
      # @!attribute [rw] rank
      #   @return [String] rank of card
      attribute :rank, String

      # implement sort based on rank of the card, 2 low ace high
      def <=>(other)
        RANKS.find_index(rank) <=> RANKS.find_index(other.rank)
      end

      # create and return a standard 52 card deck of playing cards
      def self.deck(rng = Random.new)
        all = []
        SUITS.each do |suit|
          RANKS.each do |rank|
            id = rank.to_i > 0 ? rank : rank[0]
            id += suit[0]
            all << { rank: rank, suit: suit, id: id, name: "#{rank} of #{suit}" }
          end
        end
        Deck.new(cards: all.map { |c| self.new(c) }, rng: rng)

      end
    end
  end
end
