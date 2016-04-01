require "spec_helper"

RSpec.feature "Products without variant(s)", type: :feature do
  stub_authorization!

  let!(:product) { create(:base_product) }

  before { visit spree.admin_product_path(product) }

  describe "with valid package type" do
    it "submits successfully" do
      first_option = SpreePackages::TYPES.first

      select Spree.t("packages.type.#{first_option}"),
             from: "product_package_type"

      click_button Spree.t("actions.update")

      product.reload

      expect(page).to have_content("has been successfully updated!")
      expect(product.package_type).to eq first_option
    end
  end
end
