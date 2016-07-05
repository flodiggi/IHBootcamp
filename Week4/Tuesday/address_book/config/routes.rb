Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contacts', to: 'contact#index'

  get '/contactnew', to: 'contact#new'

  post("/contacts", :to => "contact#create")

  get("/show/:id", :to => "contact#show")

  get("/favorite/:id", :to => "contact#favorite")

  post("/search", :to => "contact#search")

end
