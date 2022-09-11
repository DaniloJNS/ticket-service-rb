Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    resources :tickets, only: %w[index]
    resources :events, only: %w[index]
  end
end
Rails.application.routes.default_url_options[:host] = ENV['HOST']
