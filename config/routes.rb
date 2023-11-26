Rails.application.routes.draw do
  devise_for :users
  get 'gurumes/date'  => 'gurumes#date'
  get 'gurumes/insta'  => 'gurumes#insta'
  get 'gurumes/girl'  => 'gurumes#girl'
  get 'gurumes/family'  => 'gurumes#family'
  get 'gurumes/ryouzyuushi'  => 'gurumes#ryouzyuushi'
  get 'gurumes/other'  => 'gurumes#other'

  get 'gurumes/top'  => 'gurumes#top'
  get 'gurumes/toukou'  => 'gurumes#toukou'
  get 'gurumes/itiran'  => 'gurumes#itirann'
  get 'lectures/index'  => 'lectures#index'
  get 'lectures/new'  => 'lectures#new'
  post 'lectures/new'  => 'lectures#create'
  

  resources :gurumes
  root 'gurumes#top'
 
end
