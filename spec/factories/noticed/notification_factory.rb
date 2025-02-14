# frozen_string_literal: true

FactoryBot.define do
  factory :noticed_notification, class: "Noticed::Notification" do
    association :event, factory: :noticed_event
  end
end
