class AddDeletedAtToSpreePackages < ActiveRecord::Migration
  def change
    add_column :spree_packages, :deleted_at, :datetime

    add_index :spree_packages, :deleted_at
  end
end
