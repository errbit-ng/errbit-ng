# frozen_string_literal: true

require "rails_helper"

RSpec.describe Noticed::Notification, type: :model do
  describe "delegates params to event" do
    subject { create(:noticed_notification) }

    it { expect(subject.params).to eq(subject.event.params) }
  end

  describe "delegates record to event" do
    subject { create(:noticed_notification) }

    it { expect(subject.record).to eq(subject.event.record) }
  end

  describe "notification associations" do
    let!(:user) { create(:user) }

    before { create(:noticed_notification, recipient: user) }

    it { expect(user.notifications.count).to eq(1) }
  end

  describe "read scope" do
    before { create_list(:noticed_notification, 4, read_at: Time.current) }

    it { expect(Noticed::Notification.read.count).to eq(4) }
  end

  # test "unread scope" do
  #   assert_equal 0, Noticed::Notification.unread.count
  # end

  # test "seen scope" do
  #   assert_equal 4, Noticed::Notification.seen.count
  # end

  # test "unseen scope" do
  #   assert_equal 0, Noticed::Notification.unseen.count
  # end

  # test "mark_as_read" do
  #   Noticed::Notification.update_all(read_at: nil)
  #   assert_equal 0, Noticed::Notification.read.count
  #   Noticed::Notification.mark_as_read
  #   assert_equal 4, Noticed::Notification.read.count
  # end

  # test "mark_as_unread" do
  #   Noticed::Notification.update_all(read_at: Time.current)
  #   assert_equal 4, Noticed::Notification.read.count
  #   Noticed::Notification.mark_as_unread
  #   assert_equal 0, Noticed::Notification.read.count
  # end

  # test "mark_as_seen" do
  #   Noticed::Notification.update_all(seen_at: nil)
  #   assert_equal 0, Noticed::Notification.seen.count
  #   Noticed::Notification.mark_as_seen
  #   assert_equal 4, Noticed::Notification.seen.count
  # end

  # test "mark_as_unseen" do
  #   Noticed::Notification.update_all(seen_at: Time.current)
  #   assert_equal 4, Noticed::Notification.seen.count
  #   Noticed::Notification.mark_as_unseen
  #   assert_equal 0, Noticed::Notification.seen.count
  # end

  # test "mark_as_read_and_seen" do
  #   Noticed::Notification.update_all(read_at: nil, seen_at: nil)
  #   assert_equal 0, Noticed::Notification.read.count
  #   assert_equal 0, Noticed::Notification.seen.count
  #   Noticed::Notification.mark_as_read_and_seen
  #   assert_equal 4, Noticed::Notification.read.count
  #   assert_equal 4, Noticed::Notification.seen.count
  # end

  # test "mark_as_unread_and_unseen" do
  #   Noticed::Notification.update_all(read_at: Time.current, seen_at: Time.current)
  #   assert_equal 4, Noticed::Notification.read.count
  #   assert_equal 4, Noticed::Notification.seen.count
  #   Noticed::Notification.mark_as_unread_and_unseen
  #   assert_equal 0, Noticed::Notification.read.count
  #   assert_equal 0, Noticed::Notification.seen.count
  # end

  # test "read?" do
  #   assert noticed_notifications(:one).read?
  # end

  # test "unread?" do
  #   assert_not noticed_notifications(:one).unread?
  # end

  # test "seen?" do
  #   assert noticed_notifications(:one).seen?
  # end

  # test "unseen?" do
  #   assert_not noticed_notifications(:one).unseen?
  # end

  # test "notification url helpers" do
  #   assert_equal "http://localhost:3000/", CommentNotifier::Notification.new.root_url
  # end

  # test "ephemeral notification url helpers" do
  #   assert_equal "http://localhost:3000/", EphemeralNotifier::Notification.new.root_url
  # end

end
