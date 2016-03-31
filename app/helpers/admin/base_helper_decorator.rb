Spree::Admin::BaseHelper.class_eval do
  def package_type_options
    SpreePackages::TYPES.each_with_object([]) do |type, opt|
      opt << [Spree.t("packages.type.#{type}"), type]
    end
  end
end
