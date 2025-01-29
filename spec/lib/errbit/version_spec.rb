# frozen_string_literal: true

require "rails_helper"

RSpec.describe Errbit::Version do
  describe ".to_a" do
    it { expect(described_class.to_a).to eq([0, 1, 0]) }
  end

  describe ".to_s" do
    it { expect(described_class.to_s).to eq("0.1.0") }
  end
end
