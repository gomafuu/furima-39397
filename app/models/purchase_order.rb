class PurchaseOrder
  attr_accessor :token

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_number, :area_id,:city, 
                :addresses, :building, :phone, :token

    with_options presence: true do
    validates :user_id
    validates :item_id

    validates :token

    validates :post_number
    validates_format_of :post_number, with: /\A\d{3}-\d{4}\z/
    validates :area_id      , numericality: {other_than: 1 , message:"can't be blank"}
    validates :city 
    validates :addresses
    validates :building     , presence: false
    validates :phone
    validates_format_of :phone, with: /\A\d{10,11}\z/
    end
  

    def save
      purchase = Purchase.create(user_id: user_id,item_id: item_id)
      Order.create(
        post_number: post_number,
        area_id: area_id, 
        city: city, 
        addresses: addresses, 
        building: building, 
        phone: phone, 
        purchase: purchase
      )
    end


end