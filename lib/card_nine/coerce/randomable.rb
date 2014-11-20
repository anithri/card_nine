require 'virtus'
module CardNine
  module Coerce
    class Randomable < Virtus::Attribute
      def coerce(value)
        return value if value.respond_to?(:rand)
        return Random.new(value.to_i) if value.respond_to?(:to_i)
        return Random.new
      end
    end
  end
end
