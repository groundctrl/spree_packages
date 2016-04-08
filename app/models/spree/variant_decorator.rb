Spree::Variant.class_eval do
  validates :package_type, presence: true,
                           inclusion: { in: SpreePackages::TYPES }
  validates :height, :width, :depth,
            numericality: { greater_than_or_equal_to: 0 }
end
