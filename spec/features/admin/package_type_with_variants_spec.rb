require "spec_helper"

RSpec.feature "Products with variant(s)", type: :feature do
  stub_authorization!

  let!(:variant) { create(:variant) }

  before do
    visit spree.edit_admin_product_variant_path(variant.product, variant)
  end

  describe "with valid package type" do
    it "submits successfully" do
      first_option = SpreePackages::TYPES.first

      select Spree.t("packages.type.#{first_option}"),
             from: "variant_package_type"

      click_button Spree.t("actions.update")

      variant.reload

      expect(page).to have_content("has been successfully updated!")
      expect(variant.package_type).to eq first_option
    end
  end
end
