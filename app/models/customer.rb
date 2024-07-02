class Customer < ApplicationRecord
  belongs_to :favorite_coffee_shop, class_name: 'CoffeeShop'
  has_many :reviews  #1 model Association 1.4
  has_many :reviewed_coffee_shops, through: :reviews, source: :coffee_shop #21.5
end

#2 many-to-many . (a customer can review many coffee shops)

#1.6 validation
class Customer < ApplicationRecord
  validates :first_name, :last_name, presence: true #each customer has a first and last name
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  #email is unique and properly formatted
end
