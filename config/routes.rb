Rails.application.routes.draw do
    get '', to: 'home#index', as: 'home'
    get 'login', to: 'login#index', as: 'login'
    post 'login', to: 'login#login', as: 'certification'
    get 'logout', to: 'login#logout', as: 'logout'
    get 'user', to: 'users#new', as: 'new_user'
    get 'users', to: 'users#index', as: 'users'
    get 'user/edit', to: 'users#edit', as: 'user_edit'
    post 'user/update', to: 'users#update', as: 'user_update'
    post 'create_user', to: 'users#create', as: 'user'
    post 'toggle_active_user', to: 'users#toggle_active_user', as: 'toggle_active_user'
end
