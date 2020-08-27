class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :post_number,              null: false 
      t.integer :prefectures_id,          null: false
      t.string :city,                     null: false
      t.string :address,                  null: false
      t.string :building_name
      t.string :phone_number,             null: false
      t.references :order,                null: false,FK:true
      t.timestamps
    end
  end
end
