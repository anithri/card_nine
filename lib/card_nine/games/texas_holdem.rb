require 'card_nine'
require 'card_nine/cards/handable'
require 'card_nine/cards/locatable'
require 'card_nine/game'
require 'card_nine/deck'
module CardNine
  module Games
    class TexasHoldem < Game
      def default_areas;
        [:community];
      end

      #include Cards::Deckable
      include Cards::Handable
      include Cards::Locatable

      def init_areas
        [:community]
      end

      def default_source_deck
        CardNine.playing_cards
      end

      # clear old data, and deal 2 cards to each plaer
      def deal
        self.deck = shuffle
        puts self.init_hands.inspect
        self.hands = init_hands
        puts self.hands.inspect
        self.piles = init_piles
        2.times do
          hands.each_pair do |player, hand|
            deal_card_to(hand)
          end
        end
      end
    end
  end
end
