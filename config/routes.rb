Rails.application.routes.draw do
  mount Dashing::Engine, at: Dashing.config.engine_path
  root 'main#index'

  scope module: 'freelancer' do
    get 'freelancer' => 'freelancer#index'
    post 'freelancer/contact_me' => 'freelancer#contact_me'
  end

  scope module: 'maps' do
    resources :maps
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :markers, only: [:index]
    end
  end
end
