# frozen_string_literal: true

# To deliver this notification:
#
# NewCommentNotifier.with(record: @comment, message: "New comment").deliver(User.all)
# NewCommentNotifier.with(record: @comment).deliver(User.all)

class NewCommentNotifier < ApplicationNotifier
  deliver_by :email do |config|
    config.mailer = "Mailer"
    config.method = :comment_notification

    config.if = -> { !!recipient.preferences[:email] }
  end

  deliver_by :slack do |config|
    config.url = "https://slack.com..."
    config.json = -> {
      {
        # ...
      }
    }
  end

  deliver_by :pushover do |config|
    config.url = "https://api.pushover.net/1/messages.json"
    config.json = -> {
      {
        token: "",
        user: "",
        message: ""
      }
    }
  end

  def message
    "New comment"
  end

  class << self
    def with(record:)

    end
  end
end
