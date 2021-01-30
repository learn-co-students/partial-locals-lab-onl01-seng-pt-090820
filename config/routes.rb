Rails.application.routes.draw do
  resources :classrooms
  resources :students

  get "/", to: "students#index"
end
