module Spree
  module Admin
    class PackagesController < ResourceController
      helper "spree/admin/packages"

      def index
        per_page = params[:per_page] || Kaminari.config.default_per_page

        @packages = Spree::Package.page(params[:page])
                                  .per(per_page)
      end

      protected

      def permitted_resource_params
        params.require(:package).permit(permitted_resource_attributes)
      end

      def permitted_resource_attributes
        [
          :depth, :description, :height, :name, :package_type,
          :packing_material, :width
        ]
      end
    end
  end
end
