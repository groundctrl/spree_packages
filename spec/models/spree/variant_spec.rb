require "spec_helper"

RSpec.describe Spree::Variant, type: :model do
  context "validation" do
    let(:variant) { build(:variant) }

    it "require presence of `package_type`" do
      expect(variant).to validate_presence_of :package_type
    end

    it "allows valid package_type values" do
      SpreePackages::TYPES.each do |value|
        expect(variant).to allow_value(value).for(:package_type)
      end
    end

    it "rejects invalid package_type values" do
      expect(variant).not_to allow_value("fake").for(:package_type)
    end

    %w(depth height width).each do |dimension|
      it "requires valid values for `#{dimension}`" do
        expect(variant).to allow_value(0).for(:"#{dimension}")
      end

      it "requires valid values for `#{dimension}`" do
        expect(variant).to allow_value(0.1).for(:"#{dimension}")
      end

      it "does not allow invalid values for `#{dimension}`" do
        expect(variant).not_to allow_value("fake").for(:"#{dimension}")
      end
    end
  end
end
