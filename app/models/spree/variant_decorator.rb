Spree::Variant.class_eval do
  validates :package_type, presence: true,
                           inclusion: { in: SpreePackages::TYPES }
end
