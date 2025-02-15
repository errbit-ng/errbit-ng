# frozen_string_literal: true

module Noticed
  class Notification < ApplicationRecord
    include Rails.application.routes.url_helpers
    include Readable
    include Translation

    field :type, type: String
    field :read_at, type: Time
    field :seen_at, type: Time

    belongs_to :event, counter_cache: true
    belongs_to :recipient, polymorphic: true

    scope :newest_first, -> { order(created_at: :desc) }

    delegate :params, :record, to: :event
  end
end
