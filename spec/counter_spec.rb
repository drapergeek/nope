require_relative "../counter"
require "spec_helper"

describe Counter do
  it "starts at 0" do
    expect(Counter.new.count).to eq(0)
  end

  let(:counter) { Counter.new }
  let(:expect_counter_to_be_1_using_let) do
    expect(counter.count).to eq(1)
  end

  def expect_counter_to_be_1_by_method
    expect(counter.count).to eq(1)
  end

  describe "why you shouldn't use expect in a let" do
    it "will allow this to pass" do
      # count starts at 0, this increments to 1
      counter.increment
      # this is expected to be true and should pass
      expect_counter_to_be_1_using_let

      # this will increment the counter to 2
      counter.increment
      # this is not true, but it will pass because `let` is cached after the
      # first time it's called and only the value is returned
      expect_counter_to_be_1_using_let

      # we can increment any numnber of times and it will not fail as it should
      100.times do
        counter.increment
        puts "Counter is #{counter.count}"
        expect_counter_to_be_1_using_let
      end
    end

    it "doesn't pass if you use a method instead of a let" do
      # count starts at 0, this increments to 1
      counter.increment
      # this is expected to be true and should pass
      expect_counter_to_be_1_by_method

      # this will increment the counter to 2
      counter.increment

      # this is not true, and because it is calling a method
      # the actual `expect` will be called again
      # and the test will fail
      expect_counter_to_be_1_by_method
    end
  end
end
