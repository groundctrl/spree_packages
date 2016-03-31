require "spec_helper"

RSpec.feature "Products without variant(s)", type: :feature do
  stub_authorization!

  let!(:variant) { create(:on_demand_master_variant) }

  before { visit spree.admin_product_path(variant.product) }

  describe "with valid package type" do
    it "submits successfully" do
      newly_selected = Spree.t("packages.type.#{SpreePackages::TYPES.first}")

      select newly_selected, from: "product_package_type"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")

      visit spree.admin_product_path(variant.product)

      expect(page).to have_select "product_package_type",
                                  selected: newly_selected
    end
  end
end
