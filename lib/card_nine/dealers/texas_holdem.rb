require 'card_nine/cards/playing_card'
module CardNine
  module Dealers
    # implements a CardNine::Dealer for the game of Texas Holdem.  This is only
    #   the card movement, the betting, UI, and hand evaluation are out of the
    #   scope of this library
    # @example
    # card_eval = PretendCardEval.new
    # ui = PretendUI.new
    # wagering = PretendTexasHoldemBettingService.new
    # players = %w|Bruce Barbera Dick|
    # dealer = CardNine::Dealers::TexasHoldem.new(players: players)
    # hand = dealer.new_hand
    # ui.update(hand)
    # wagering(:ante, hand)
    # [:deal_hole_cards, :flop, :turn, :river].each do |stage|
    #   ui.update(hand.deal_stage(stage))
    #   wagering(:round, hand)
    # end
    # wager(:resolve, hand)
    class TexasHoldem

      attr_accessor :players, :deck

      STAGES = {
          deal_hole_cards: ->(h) { h.deal_players(2) },
          flop:            ->(h) { h.discard; h.deal(3, to: :community) },
          turn:            ->(h) { h.discard; h.deal(to: :community) },
          river:           ->(h) { h.discard; h.deal(to: :community) }
      }

      def initialize(players:, deck: CardNine::Cards::PlayingCard.deck)
        @players = players
        @deck    = deck
      end

      # generate a new hand from this dealer
      # @return [CardNine::Hand]
      def new_hand
        players.rotate!
        #Hand.start(players: players, deck: deck, stages: STAGES)
      end

    end
  end
end
