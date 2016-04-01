require "spec_helper"

RSpec.describe Spree::Package, type: :model do
  context "validation" do
    let(:package) { build(:package) }

    it "require unique `name`" do
      expect(package).to validate_uniqueness_of :name
    end

    it "allows valid package_type values" do
      SpreePackages::TYPES.each do |value|
        expect(package).to allow_value(value).for(:package_type)
      end
    end

    it "rejects invalid package_type values" do
      expect(package).not_to allow_value("fake").for(:package_type)
    end

    %w(depth height width).each do |dimension|
      it "requires valid values for `#{dimension}`" do
        expect(package).to allow_value(1).for(:"#{dimension}")
      end

      it "does not allow invalid values for `#{dimension}`" do
        expect(package).not_to allow_value(0).for(:"#{dimension}")
      end
    end
  end
end
