class CreatePackages < ActiveRecord::Migration
  def change
    create_table :spree_packages do |t|
      t.string :name
      t.string :description
      t.string :package_type, default: "poly"
      t.decimal :height, precision: 8, scale: 2
      t.decimal :width, precision: 8, scale: 2
      t.decimal :depth, precision: 8, scale: 2
      t.boolean :packing_material, default: false

      t.timestamps
    end

    add_index :spree_packages, :name, unique: true
  end
end
