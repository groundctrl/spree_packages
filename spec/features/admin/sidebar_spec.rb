require "spec_helper"

RSpec.feature "Sidebar link" do
  stub_authorization!

  let(:general_path) { spree.edit_admin_general_settings_path }
  let(:packages_path) { spree.admin_packages_path }
  let(:element) { ".sidebar li:last-child.active" }

  it "shows in the sidebar" do
    visit general_path

    expect(page).to have_link(Spree.t("packages.sidebar"), href: packages_path)
    expect(page).to_not have_css(element)
  end

  it "shows highlighted in the sidebar" do
    visit packages_path

    expect(page).to have_css(element)
  end
end
