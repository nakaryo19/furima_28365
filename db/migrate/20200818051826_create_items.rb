class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,       null: false, foreign_key:true
      t.string :name,           null: false
      t.string :text,           null: false
      t.integer :category_id,   null: false
      t.integer :product_id,    null: false
      t.integer :delivery_id,   null: false
      t.integer :area_id,       null: false
      t.integer :days_id,       null: false
      t.integer :price,         null: false
      t.timestamps
    end
  end
end