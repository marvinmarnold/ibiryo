Ibiryo::Application.routes.draw do

  resources :marketing_strategies

  resources :feedbacks

  resources :shops do
    resources :menus
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


  devise_for :customers,  :only => :registrations, :skip_helpers => true do
    get '/start' => "devise/registrations#new"
  end

  devise_for :users do
    get '/login' => "devise/sessions#new"
  end

  root to: redirect("/start")

end
