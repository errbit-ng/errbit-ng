# frozen_string_literal: true

FactoryBot.define do
  factory :noticed_event, class: "Noticed::Event" do
    type { "CommentNotifier" }

    association :record, factory: :user
  end
end
