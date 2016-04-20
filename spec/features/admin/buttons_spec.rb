require "spec_helper"

RSpec.feature "Action button in title bar" do
  stub_authorization!

  let(:index_path) { spree.admin_packages_path }
  let(:new_path) { spree.new_admin_package_path }
  let(:new_element) { "[data-hook='toolbar'] a[href='#{new_path}']" }
  let(:index_element) { "[data-hook='toolbar'] a[href='#{index_path}']" }

  describe "package listing" do
    before { visit index_path }

    it "links to create package" do
      expect(page).to have_css(new_element)
    end
  end

  describe "new package" do
    before { visit new_path }

    it "links to package listing" do
      expect(page).to have_css(index_element)
    end
  end

  describe "package edit" do
    before { visit spree.edit_admin_package_path(create(:package)) }

    it "links to package listing" do
      expect(page).to have_css(index_element)
    end

    it "links to package create" do
      expect(page).to have_css(new_element)
    end
  end
end
