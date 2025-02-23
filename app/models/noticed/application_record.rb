# frozen_string_literal: true

module Noticed
  class ApplicationRecord
    include Mongoid::Document
    include Mongoid::Timestamps
  end
end
