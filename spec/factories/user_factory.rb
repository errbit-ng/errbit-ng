# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }

    password { Faker::Internet.password }

    name { Faker::Name.name }
  end
end
