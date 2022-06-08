Rails.application.routes.draw do
    get '', to: 'home#index', as: 'home'
    get 'login', to: 'login#index', as: 'login'
    post 'login', to: 'login#login', as: 'certification'
    get 'logout', to: 'login#logout', as: 'logout'
    get 'user', to: 'users#new', as: 'new_user'
    post 'create_user', to: 'users#create', as: 'user'
end
