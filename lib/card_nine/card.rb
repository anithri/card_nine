require 'virtus'
require 'card_nine/face'
module CardNine
  class Card
    include Virtus.model

    attribute :name, String
    attribute :front_face, Face
  end
end


