# frozen_string_literal: true

module Noticed
  module Readable
    extend ActiveSupport::Concern

    included do
      scope :read, -> { where.not(read_at: nil) }
      scope :unread, -> { where(read_at: nil) }
      scope :seen, -> { where.not(seen_at: nil) }
      scope :unseen, -> { where(seen_at: nil) }
    end


  end
end
