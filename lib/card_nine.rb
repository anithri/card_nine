require 'card_nine/deck'

module CardNine
  def self.playing_cards(skip_jokers = true)
    pc    = []
    suits = %w|S D H C|
    ranks = %w|2 3 4 5 6 7 8 9 10 J Q K A|


    suits.each do |suit|
      ranks.each do |rank|
        pc << { code: rank + suit }
      end
    end
    deck = CardNine::Deck.new(cards: pc)
  end
end
