# frozen_string_literal: true

module Noticed
  class Ephemeral
    include ActiveModel::Model
    include ActiveModel::Attributes
    include Noticed::Deliverable
    include Noticed::Translation
    include Rails.application.routes.url_helpers


  end
end
