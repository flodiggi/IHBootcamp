require 'sinatra'
require 'sinatra/reloader'


get '/' do
  erb :home
end


get '/home' do
  redirect to '/'
end
