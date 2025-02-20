# frozen_string_literal: true

module Noticed
  class DeliveryMethod < Noticed::ApplicationJob
    include RequiredOptions
  end
end
