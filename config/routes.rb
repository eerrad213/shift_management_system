Rails.application.routes.draw do
  get "/reports", to: "shifts#reports"
  get "/userReport/:user_id", to: "shifts#userReports"
  post "/approve_request", to: "requests#approve"
  post "/deny_request", to: "requests#deny"
  post "/assign_shift", to: "shifts#assign_shift"
  post "/create_shift_template", to: 'shift_template#create'
  get "/assigned_shifts/:id", to: "users#assigned_shifts", as: :assigned_shifts
  post "/change_shift", to: 'requests#change_shift', as: :change_shift
  post "/make_shift_available", to: 'requests#make_shift_available', as: :make_shift_available
  patch "/pick_up_shift/:id", to: 'requests#pick_up_shift', as: :pick_up_shift
  patch "/give_shift/:id", to: 'requests#give_shift', as: :give_shift
  patch "/approve_shift/:id", to: 'requests#approve_shift', as: :approve_shift


  devise_scope :user do
    get '/signup', to: 'registrations#new'
    post '/new_user', to: 'registrations#create', as: :create_user
    get '/add_employee', to: 'registrations#new_employee', as: :new_employee
    post '/create_employee', to: 'registrations#create_employee', as: :create_employee
  end

  devise_for :users

  resources :requests

  get '/users/sign_in', to: 'sessions#create', as: 'login'

  get 'company/new'

  get '/dashboard', to: 'welcome#dashboard', as: :dashboard

  root "welcome#splash"
end
