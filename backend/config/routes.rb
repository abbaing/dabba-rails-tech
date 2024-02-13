Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index show create update destroy]
      namespace :cart do
        get 'subtotal', to: 'cart#subtotal'
      end
    end
  end
end
