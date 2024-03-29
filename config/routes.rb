Ibiryo::Application.routes.draw do
  resources :food_searches

  resources :carts do
    resources :line_items
  end

  resources :marketing_strategies

  resources :feedbacks

  resources :shops do
    resources :menus
    resources :options
    resources :choices
  end

  resources :menus do
    resources :menu_sections
  end

  resources :menu_sections do
    resources :items
  end

  match 'contact' => 'feedbacks#new'
  match 'about' => 'pages#about'
  match 'security' => 'pages#security'
  match 'help' => 'pages#help'
  match 'legal' => 'pages#legal'

  devise_for :users do
    get '/login' => "devise/sessions#new"
    get '/start' => "devise/registrations#new"
  end

  root to: "pages#index"

end
