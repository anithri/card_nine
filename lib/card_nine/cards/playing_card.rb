require 'card_nine/card'

module CardNine
  module Cards
    class PlayingCard
      include Comparable
      include Card

      SUITS = %w|Clubs Hearts Diamonds Spades|.freeze
      RANKS = %w|2 3 4 5 6 7 8 9 10 J Q K A|.freeze

      attribute :suit, String
      attribute :rank, String

      def <=>(other)
        RANKS.find_index(rank) <=> RANKS.find_index(other.rank)
      end
    end
  end
end
