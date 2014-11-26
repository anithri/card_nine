module CardNine
  module Cards
    # The simplest card possible.  A Nothing added class with Card included
    class SimpleCard
      # @!method initialize(args = nil)
      #   will set the instance vars using the keys of args as a attribute name
      #   @param [Hash, Nil] args
      include Card
    end
  end
end
