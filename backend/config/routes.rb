Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show create update destroy]
      namespace :cart do
        post 'subtotal'
      end
    end
  end
end
