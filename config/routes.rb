Rails.application.routes.draw do
    get '', to: 'home#index', as: 'home'
    get 'login', to: 'login#index', as: 'login'
    post 'login', to: 'login#login', as: 'certification'
    get 'logout', to: 'login#logout', as: 'logout'
end
