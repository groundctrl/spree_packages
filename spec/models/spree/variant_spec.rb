require "spec_helper"

RSpec.describe Spree::Variant, type: :model do
  context "validation" do
    let(:variant) { build(:variant) }

    it "require presence of `package_type`" do
      expect(variant).to validate_presence_of :package_type
    end

    it "allows valid values" do
      SpreePackages::TYPES.each do |value|
        expect(variant).to allow_value(value).for(:package_type)
      end
    end

    it "rejects invalid values" do
      expect(variant).not_to allow_value("fake").for(:package_type)
    end
  end
end
