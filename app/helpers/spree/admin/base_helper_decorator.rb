Spree::Admin::BaseHelper.class_eval do
  def package_type_options
    [].tap do |obj|
      SpreePackages::TYPES.each do |type|
        obj << [Spree.t("packages.type.#{type}"), type]
      end
    end
  end
end
