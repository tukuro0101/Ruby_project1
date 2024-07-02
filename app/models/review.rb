class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :coffee_shop
end


#1.6 validations
class Review < ApplicationRecord
  validates :rating, presence: true, inclusion: { in: 1..5 } # rating is between 1 and 5
  validates :comment, presence: true, length: { maximum: 1000 } # each review has a comment and limits it to 1000 characters
  validates :customer_id, presence: true #each review is associated with a customer
  validates :coffee_shop_id, presence: true #each review is associated with a coffee shop
end
