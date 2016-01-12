require "test_helper"

describe Listing do
  let(:listing) { Listing.new }

  it "must be valid" do
    value(listing).must_be :valid?
  end
end
