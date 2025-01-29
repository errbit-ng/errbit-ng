# frozen_string_literal: true

module Errbit
  module Version
    MAJOR = 0
    MINOR = 1
    TINY = 0

    ARRAY = [MAJOR, MINOR, TINY].compact

    def self.to_a
      ARRAY
    end

    def self.to_s
      ARRAY.join(".")
    end
  end
end
