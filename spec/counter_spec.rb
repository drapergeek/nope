require_relative "../counter"
require "spec_helper"

describe Counter do
  it "starts at 0" do
    expect(Counter.new.count).to eq(0)
  end
end
