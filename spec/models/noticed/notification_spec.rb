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

  describe "unread scope" do
    before { create_list(:noticed_notification, 4, read_at: Time.current) }

    it { expect(Noticed::Notification.unread.count).to eq(0) }
  end

  describe "seen scope" do
    before { create_list(:noticed_notification, 4, seen_at: Time.current) }

    it { expect(Noticed::Notification.seen.count).to eq(4) }
  end

  describe "unseen scope" do
    before { create_list(:noticed_notification, 4, seen_at: Time.current) }

    it { expect(Noticed::Notification.unseen.count).to eq(0) }
  end

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

  describe "mark_as_unread_and_unseen" do
    before { create_list(:noticed_notification, 4, read_at: Time.current, seen_at: Time.current) }

    it do
      expect(Noticed::Notification.read.count).to eq(4)

      expect(Noticed::Notification.seen.count).to eq(4)

      Noticed::Notification.mark_as_unread_and_unseen

      expect(Noticed::Notification.read.count).to eq(0)

      expect(Noticed::Notification.seen.count).to eq(0)
    end
  end

  describe "read?" do
    subject { create(:noticed_notification, read_at: Time.current) }

    it { expect(subject.read?).to eq(true) }
  end

  describe "unread?" do
    subject { create(:noticed_notification, read_at: nil) }

    it { expect(subject.unread?).to eq(true) }
  end

  describe "seen?" do
    subject { create(:noticed_notification, seen_at: Time.current) }

    it { expect(subject.seen?).to eq(true) }
  end

  describe "unseen?" do
    subject { create(:noticed_notification, seen_at: nil) }

    it { expect(subject.unseen?).to eq(true) }
  end

  describe "notification url helpers" do
    it { expect(CommentNotifier::Notification.new.root_url).to eq("http://localhost:3000/") }
  end

  describe "ephemeral notification url helpers" do
    it { expect(EphemeralNotifier::Notification.new.root_url).to eq("http://localhost:3000/") }
  end
end
