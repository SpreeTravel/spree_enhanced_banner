Spree::Core::Engine.routes.draw do
	namespace :admin do
    resources :taxons do
    	resources :enhanced_banners, only: [:index, :new, :create, :destroy]
    end
    resource :enhanced_banner_settings, only: [:edit] do
    	post :save, :on => :member
    end
  end
end
