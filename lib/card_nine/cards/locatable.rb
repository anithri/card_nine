require 'virtus'
require 'card_nine/card'
module CardNine
  module Cards
    # A Card mixin that provides board locations similar to Cards::Handable
    module Locatable
      include Virtus.module

      # @!attribute [rw] locations
      #   @return [Array]
      attribute :areas, Array, default: :default_areas

      def piles
        @piles ||= init_piles
      end

      def piles=(new_val)
        @piles = new_val
      end

      def area_pile(location)
        piles[location]
      end

      # @abstract meant to be overridden by classes
      #   @todo maybe this should be another form of class data
      #   @return [Array]
      def default_areas
        []
      end

      def init_piles
        new_piles = {}
        areas.each { |area| new_piles[area] = [] }
        new_piles
      end
    end
  end
end
