require 'virtus'
require 'card_nine/card'
module CardNine
  module Cards
    module Handable
      include Virtus.module

      # @!attribute [rw] players
      #   @return [Array]
      attribute :players, Array, default: ->(*a) { [] }
      attribute :hands, Hash, default: {}

      def player_hand(player_name)
        hands[player_name]
      end

      def init_hands
        new_hand = {}
        players.each { |area| new_hand[area] = [] }
        new_hand
      end

    end
  end
end
