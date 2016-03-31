require "spec_helper"

RSpec.feature "Products with variant(s)", type: :feature do
  stub_authorization!

  let(:product) { create(:product) }
  let!(:variant_1) { create(:variant, product: product) }

  before { visit spree.edit_admin_product_variant_path(product, variant_1) }

  describe "with valid package type" do
    it "submits successfully" do
      newly_selected = Spree.t("packages.type.#{SpreePackages::TYPES.first}")

      select newly_selected, from: "variant_package_type"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")

      visit spree.edit_admin_product_variant_path(product, variant_1)

      expect(page).to have_select "variant_package_type",
                                  selected: newly_selected
    end
  end
end
