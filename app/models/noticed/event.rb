# frozen_string_literal: true

module Noticed
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps

    field :type, type: String
    field :params, type: Hash, default: {}
    field :notifications_count, type: Integer

    belongs_to :record, polymorphic: true, optional: true

    has_many :notifications, dependent: :destroy
  end
end
