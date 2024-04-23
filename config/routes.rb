Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :links, only: [:create]
  get '/links/:tracking_code', to: 'links#show'
  get '/:tracking_code', to: 'links#redirect'
end
