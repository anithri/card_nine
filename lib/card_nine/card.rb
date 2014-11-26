require 'virtus'

module CardNine
  # provides the base functionality required of a card
  module Card
    # @!method initialize(args = nil)
    #   will set the instance vars using the keys of args as a attribute name
    #   @param [Hash, Nil] args

    include Virtus.module

    attribute :name
    attribute :id

    # @!attribute [rw] name
    #   @return [String,Symbol,#to_s,Object] name of the card
    # @!attribute [rw] id
    #   @return [String,Symbol,Object] id of the card

  end

end
