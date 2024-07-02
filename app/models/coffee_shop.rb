class CoffeeShop < ApplicationRecord
  has_many :reviews
  has_many :customers, through: :reviews
  has_many :fans, class_name: 'Customer', foreign_key: 'favorite_coffee_shop_id'
end
#one-to-many association between CoffeeShops and Reviews
