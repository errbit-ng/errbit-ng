# frozen_string_literal: true

module Noticed
  module Deliverable
    class DeliverBy
      attr_reader :name, :config, :bulk

      def initialize(name, config, bulk: false)
        @name = name
        @config = config
        @bulk = bulk
      end
    end
  end
end
