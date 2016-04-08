class SetDefaultDimensionsInSpreeVariants < ActiveRecord::Migration
  def change
    change_column :spree_variants, :height, :decimal, precision: 8, scale: 4, default: 0.0
    change_column :spree_variants, :width, :decimal, precision: 8, scale: 4, default: 0.0
    change_column :spree_variants, :depth, :decimal, precision: 8, scale: 4, default: 0.0
  end
end
