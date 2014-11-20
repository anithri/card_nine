module CardNine
  class Face
    include Virtus.model

    # @!attribute [rw] title
    #   @return [String]
    attribute :title, String

    # @!attribute [rw] text
    #   @return [String] default ''
    attribute :id, String, default: ''

  end
end
