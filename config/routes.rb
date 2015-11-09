Rails.application.routes.draw do

  resources :admin_images
  
  resources :filmschool_comments

  resources :filmschools

  resources :uploads

  resources :bookings do
    member do
      put 'book'
      put 'approved_bookings'
      put 'bookings_done'
      get 'approved_bookings', :controller => 'bookings', :action => 'mobile_approved_bookings'
      get 'bookings_done', :controller => 'bookings', :action => 'mobile_bookings_done'
    end
  end

  #get 'home/index'

  get '/admin_log', :controller => 'home', :action => 'admin_log'
  get '/filmriket', :controller => 'home', :action => 'filmriket'
  get '/about', :controller => 'home', :action => 'about'
  get '/contact', :controller => 'home', :action => 'contact'

  resources :events do
    get :autocomplete_club_name, :on => :collection
    member do
      put 'add_club'
      put 'delete_club'
    end
  end

  resources :news

  resources :ratings

  resources :reviews do
    get 'upload'
    patch 'attach'
    get 'attach'
    get 'approve_review', to: 'reviews'
  end

  resources :club_movies do
    get 'upload'
    patch 'attach'
    get 'attach'
    get 'approve_club_movie', to: 'club_movies'
  end

  resources :movie_comments

  resources :movies

  resources :clubs do
    get :autocomplete_club_name, :on => :collection
  end

  devise_for :users

  resources :users do
    get :ajax_on_users, :on => :collection
    member do
      put 'approve'
      put 'admin_approve'
      put 'disapprove'
      put 'disapprove_all'
      get 'approve', :controller => 'users', :action => 'mobile_approve'
      get 'admin_approve', :controller => 'users', :action => 'mobile_admin_approve'
      get 'disapprove', :controller => 'users', :action => 'mobile_disapprove'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
