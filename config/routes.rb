Rails.application.routes.draw do


  get 'users/new', to: "users#new", as: 'new_user'
  get 'users/:id', to: "users#show", as: 'user'
  post 'users/:id', to: "users#create"

  get 'calendars/:id', to: "calendars#show", as: 'calendar'

  get 'events/', to: "events#index", as: 'events'

  
end
