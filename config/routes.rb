Rails.application.routes.draw do


  get 'users/new', to: "users#new", as: 'new_user'
  get 'users/:id', to: "users#show", as: 'user'
  post 'users/:id', to: "users#create"

  get 'calendar/new', to: "calendars#new"
  post 'calendars/:id', to: "calendars#create"
  get 'calendars/:id', to: "calendars#show", as: 'calendar'

  # get 'events_calendars/new', to: "events_calendars#new", as: 'new_event_calendar'
  post 'events_calendars/:id', to: "events_calendars#create", as: 'new_event_calendar'

  get "/", to: "events#home", as: "home"
  get 'events/', to: "events#index", as: 'events'
  get 'events/search', to: "events#search", as: 'search_event'
  get 'events/:id', to: "events#show", as: 'event'

  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create', as: 'sessions'
  delete 'sessions', to: 'sessions#destroy', as: 'delete_session'

  delete 'events_calendars/:id', to: 'events_calendars#destroy', as: 'delete_event_calendar'



  
end
