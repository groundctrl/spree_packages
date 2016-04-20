Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :packages, except: [:show]
  end
end
