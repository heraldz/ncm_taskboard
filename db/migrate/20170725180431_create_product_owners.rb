class CreateProductOwners < ActiveRecord::Migration
  def change
    create_table :product_owners do |t|
      t.string :name

      t.timestamps
    end
  end
end
