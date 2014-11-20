require 'virtus'
module CardNine
  # this is a class meant to be included in card object and constitutes the
  #   api for what it means to be a Card
  module Card

    include Virtus.module
    attribute :name, String
    attribute :id, String

  end

  class PlayingCard
    include Card

  end
end


