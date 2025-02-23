# frozen_string_literal: true

module Noticed
  module DeliveryMethods
    class Email < DeliveryMethod
      required_options :mailer, :method
    end
  end
end
