class CreateProducts < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    create_table :product_lists do |t|
      t.string :name
      t.string :sku_id
      t.text :categories, array: true, default: []
      t.hstore :vars
      t.text :tags, array: true, default: []
      t.bigint :price
      t.text :description
      t.hstore :images, array: true
      t.string :expire_date
      t.timestamps null: false
    end
   end
end
