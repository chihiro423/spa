Rails.application.routes.draw do
  devise_for :users
  get 'hotsprings/top' => 'hotsprings#top'
  get 'hotsprings/:hotspring_id/likes' => 'likes#create'
  get 'hotsprings/:hotspring_id/likes/:id' => 'likes#destroy'
  resources :hotsprings
  resources :hotsprings do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  root 'hotsprings#top'
end
