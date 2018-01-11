require_relative '../tickable'

class FieldObject < Tickable
    attr_reader :alliance

    def initialize(alliance)
        @alliance = alliance
    end
end