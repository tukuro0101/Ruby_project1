class CoffeeShop < ApplicationRecord
  has_many :reviews #1 model Association 1.4
  has_many :customers, through: :reviews #2  1.5
  has_many :fans, class_name: 'Customer', foreign_key: 'favorite_coffee_shop_id'
end
#1 1-to-many . between CoffeeShops model and Reviews model

#2 has_many :customers, through: :reviews
#2 many-to-many between CoffeeShops and Customers through Reviews

#3  has_many :fans association (1-many) (CoffeeShop can have many fans)


#1.6 validation
class CoffeeShop < ApplicationRecord
  validates :name, presence: true, uniqueness: true #each coffee shop has a unique name
  validates :location, presence: true # each coffee shop has a location
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 } # Ensures rating is between 0 and 5
  validates :description, length: { maximum: 500 } # Limits description to 500 characters
end
