require 'virtus'

module CardNine
  # provides the base functionality required of a card
  module Card
    include Virtus.module

    attribute :name
    attribute :id
  end

  class SimpleCard

  end
end
