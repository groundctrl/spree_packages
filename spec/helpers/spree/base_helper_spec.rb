require "spec_helper"

RSpec.describe Spree::Admin::BaseHelper, type: :helper do
  context "#package_type_options" do
    it "should return 4 items" do
      expect(helper.package_type_options).to have(4).items
    end
  end
end
