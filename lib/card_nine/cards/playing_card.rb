require 'card_nine/card'

module CardNine
  module Cards
    class PlayingCard
      # @note implements comparable
      include Comparable

      # @!method initialize(args = nil)
      #   will set the instance vars using the keys of args as a attribute name
      #   @param [Hash, Nil] args
      include Card

      # ALL Suits of cards
      SUITS = %w|Clubs Hearts Diamonds Spades|.freeze
      # All Ranks of cards
      RANKS = %w|2 3 4 5 6 7 8 9 10 J Q K A|.freeze

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
    end
  end
end
