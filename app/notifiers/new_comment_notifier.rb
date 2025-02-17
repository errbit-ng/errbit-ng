# frozen_string_literal: true

# To deliver this notification:
#
# NewCommentNotifier.with(record: @comment, message: "New comment").deliver(User.all)

class NewCommentNotifier < ApplicationNotifier
  deliver_by :email do |config|
    config.mailer = "Mailer"
    config.method = :comment_notification

    config.if = -> { !!recipient.preferences[:email] }
  end
end
