require "spec_helper"

RSpec.describe Spree::Admin::PackagesController, type: :controller do
  stub_authorization!

  describe "GET #index" do
    it "assigns all packages as @packages" do
      packages = create_list(:package, 5)

      spree_get :index

      expect(assigns(:packages)).to eq(packages)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:params) do
        {
          name: "New Package",
          package_type: "poly",
          height: 0.1,
          width: 0.1,
          depth: 0.1
        }
      end

      it "creates a new package" do
        expect do
          spree_post :create, package: params
        end.to change(Spree::Package, :count).by(1)
      end
    end

    context "with invalid params" do
      let(:params) do
        { name: nil }
      end

      it "assigns a newly created but unsaved package as @package" do
        spree_post :create, package: params

        expect(assigns(:package)).to be_a_new(Spree::Package)
      end

      it "re-renders the 'new' template" do
        spree_post :create, package: params

        expect(response).to render_template(:new)
      end
    end
  end
end
