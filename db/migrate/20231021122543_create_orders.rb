class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :post_number   ,null:false
      t.integer :area_id      ,null:false
      t.string :city          ,null:false
      t.string :addresses     ,null:false
      t.string :building
      t.string :phone         ,null:false

      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
