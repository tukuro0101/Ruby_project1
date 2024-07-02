class CoffeeShop < ApplicationRecord
  has_many :reviews
  has_many :customers, through: :reviews
end

# app/models/customer.rb
class Customer < ApplicationRecord
  belongs_to :favorite_coffee_shop, class_name: 'CoffeeShop'
  has_many :reviews
  has_many :reviewed_coffee_shops, through: :reviews, source: :coffee_shop
end

# app/models/review.rb
class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :coffee_shop
end
