require "spec_helper"

RSpec.feature "Update package settings in general settings", type: :feature do
  stub_authorization!

  before { visit spree.edit_admin_general_settings_path }

  describe "with handling fee" do
    it "submits successfully whole value" do
      fill_in Spree.t("packages.handling_fee"), with: "10"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.handling_fee"),
                                 with: "10")
    end

    it "resets decimal value but submits successfully" do
      fill_in Spree.t("packages.handling_fee"), with: "1.10"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.handling_fee"), with: "1")
    end

    it "resets value but submits successfully" do
      fill_in Spree.t("packages.handling_fee"), with: "foo"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.handling_fee"), with: "0")
    end
  end

  describe "with packaging material weight" do
    it "submits successfully whole value" do
      fill_in Spree.t("packages.packing_material_weight"), with: "1"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.packing_material_weight"),
                                 with: "1.0")
    end

    it "submits successfully decimal value" do
      fill_in Spree.t("packages.packing_material_weight"), with: "1.1"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.packing_material_weight"),
                                 with: "1.1")
    end

    it "resets value but submits successfully" do
      fill_in Spree.t("packages.packing_material_weight"), with: "foo"

      click_button Spree.t("actions.update")

      expect(page).to have_content("has been successfully updated!")
      expect(page).to have_field(Spree.t("packages.packing_material_weight"),
                                 with: "0.0")
    end
  end
end
