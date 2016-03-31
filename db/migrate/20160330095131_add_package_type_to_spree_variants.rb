class AddPackageTypeToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :package_type, :string, default: "poly"

    add_index :spree_variants, :package_type
  end
end
