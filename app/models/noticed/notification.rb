# frozen_string_literal: true

module Noticed
  class Notification < ApplicationRecord
    field :type, type: String
    field :read_at, type: Time
    field :seen_at, type: Time

    belongs_to :event, counter_cache: true
    belongs_to :recipient, polymorphic: true

    delegate :params, :record, to: :event
  end
end
