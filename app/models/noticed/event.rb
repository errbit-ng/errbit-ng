# frozen_string_literal: true

module Noticed
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps
  end
end
