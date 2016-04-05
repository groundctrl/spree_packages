module Spree
  class PackageSetting < Preferences::Configuration
    preference :handling_fee, :integer, default: 0
    preference :packing_material_weight, :decimal, default: 0.0
  end
end
