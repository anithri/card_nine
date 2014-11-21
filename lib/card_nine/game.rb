require 'virtus'
require 'card_nine/deck'

module CardNine
  # The deal class orchestrates distributing, managing, locating, and moving
  #   cards from location to location.  A location might be the draw deck,
  #   discard pile, or a player's hand.
  class Game
    include Virtus.model

    # @!attribute [rw] source_deck
    #   @return [CardNineDeck]
    attribute :source_deck, Deck, default: :default_source_deck

    # # @!attribute [rw] discard
    #   @return [Array]
    attribute :discard, Array, default: ->(*a) { [] }

    # @!attribute [rw] rng
    #   @return [Random]
    attribute :rng, Random, default: ->(*a) { Random.new }

    def deck
      @deck ||= shuffle(rng)
    end

    def deck=(new_val)
      @deck = new_val
    end

    def shuffle(shuffle_rng = rng)
      source_deck.shuffle(shuffle_rng)
    end

    # @abstract MEANT TO BE OVERRIDDEN to find appropriate targets for move
    #   actions
    def search_for_card(name)
      raise NotImplementedError
    end

    # @abstract MEANT TO BE OVERRIDDEN to set default search
    def default_source_deck
      Deck.new
    end

    def deal_card_to(hand)
      hand << deck.pop
    end

  end
end
