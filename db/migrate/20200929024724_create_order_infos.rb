class CreateOrderInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :order_infos do |t|
      t.references :order,            null: false, foreign_key: true 
      t.string :postcode,             null: false                    
      t.integer :shipping_address_id, null: false                    
      t.string :city,                 null: false                    
      t.string :house_number,         null: false                    
      t.string :building_name                                    
      t.string :phone_number,         null: false
      t.timestamps
    end
  end
end
