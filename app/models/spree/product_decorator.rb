Spree::Product.class_eval do
  delegate_belongs_to :master, :package_type
end
