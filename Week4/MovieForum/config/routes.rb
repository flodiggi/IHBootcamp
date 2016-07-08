Rails.application.routes.draw do
  get '/movies/discussion/:imdbid', to: 'movies#discuss'

  resources :movies

   get '/search', to: 'movies#search'

  resources :comments

end
