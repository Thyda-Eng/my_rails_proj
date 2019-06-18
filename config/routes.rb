Rails.application.routes.draw do

  root to: 'home#index'

  get    '/student_registration',  to: 'students#new'
  get    '/student_performance',  to: 'student_performances#performance_graph'

  resources :students
  resources :student_performances

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resource :student_performances
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
