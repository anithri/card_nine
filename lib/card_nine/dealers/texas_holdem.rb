require 'card_nine/cards/playing_card'
require 'card_nine/dealer'
require 'card_nine/table'

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
    class TexasHoldem < CardNine::Dealer

      # A hash of stages
      # @return [Hash<Symbol => Proc>]
      STAGES = {
          deal_hole_cards: ->(t) { t.deal_players(2) },
          flop:            ->(t) { t.discard; t.deal(3, to: :community) },
          turn:            ->(t) { t.discard; t.deal(to: :community) },
          river:           ->(t) { t.discard; t.deal(to: :community) },
          fold:            ->(t, p) { t.remove_player(p) }
      }

      # create a new dealer using a PlayingCard Deck
      def initialize
        super CardNine::Cards::PlayingCard.deck, [:community], STAGES
      end
    end
  end
end
