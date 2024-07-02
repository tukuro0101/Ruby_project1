Rails.application.routes.draw do
  root 'pages#about'
  get 'about', to: 'pages#about'
end
