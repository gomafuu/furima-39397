class Items < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string    :title,          null: false
      t.text      :detail,         null: false
      t.integer   :category_id,    null: false
      t.integer   :condition_id,   null: false
      t.integer   :delivery_id,    null: false
      t.integer   :area_id,        null: false
      t.integer   :deliverydate_id,null: false
      t.integer   :price,          null: false

      t.integer :user_id

      t.references :user, null: false, foreign_key: true
      
      t.timestamps 
    end
  end
end
