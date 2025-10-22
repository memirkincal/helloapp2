Rails.application.routes.draw do
  root "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # API namespace for the assignment
  namespace :api do
    namespace :v1 do
      resources :students, only: [:index, :show, :create, :update, :destroy]
      resources :teachers, only: [:index, :show, :create, :update, :destroy]
      resources :courses, only: [:index, :show, :create, :update, :destroy]
      resources :exams, only: [:index, :show, :create, :update, :destroy]
      resources :grades, only: [:index, :show, :create, :update, :destroy]

      get 'students/:id/grade_report', to: 'students#grade_report'
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
