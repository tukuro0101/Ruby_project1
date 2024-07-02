# config/routes.rb
Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'customers/index'
  get 'customers/show'
  get 'coffee_shops/index'
  get 'coffee_shops/show'
  resources :coffee_shops, only: [:index, :show]
  resources :customers, only: [:index, :show]
  resources :reviews, only: [:index, :show]
  get 'about', to: 'pages#about'
  root 'coffee_shops#index'
end

# provide a way to list all records for each mod
class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.all
  end

  def show
    @coffee_shop = CoffeeShop.find(params[:id])
  end
end

# app/controllers/customers_controller.rb
class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end
end

# app/controllers/reviews_controller.rb
class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end
end
