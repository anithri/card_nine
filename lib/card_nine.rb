require 'card_nine/deck'
require 'card_nine/cards/playing'

module CardNine
  # Generate a standard pack of 52 playing cards
  # @todo might be useful to extract out suits and ranks so alternate decks
  #   that follow the same basic rule can be described.  Have no need yet
  def self.playing_cards
    deck  = CardNine::Deck.new
    suits = %w|Spades Diamonds Hearts Clubs|
    ranks = %w|2 3 4 5 6 7 8 9 10 Jack Queen King Ace|

    suits.each do |suit|
      ranks.each do |rank|
        name       = "#{rank} of #{suit}"
        short_rank = rank.length > 2 ? rank[0] : rank
        id         = "#{short_rank}#{suit[0]}"
        params     = { name: name, rank: rank, suit: suit, id: id }
        deck.add_card(CardNine::Cards::Playing.new(params))
      end
    end

    deck
  end
end
