require 'card_nine/deck'
require 'card_nine/face'

module CardNine
  def self.playing_cards(skip_jokers = true)
    pc    = []
    suits = ['Spades', 'Diamonds', 'Hearts', 'Clubs']
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
    suits.each do |suit|
      ranks.each do |rank|
        text = name = "#{rank} of #{suit}"
        tags = [rank, suit]
        slug = "#{rank}#{suit[0]}"
        pc << {name: name, tags: tags, slug: slug, text: text}
      end
    end
    deck = CardNine::Deck.new(cards: pc)
  end
end
