require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/models/loginEngine.rb'
set :port, 3010
enable :sessions

get '/' do
  'here will be a profil page'
end

get '/login' do
  erb :login
end

loginEngine = LoginEngine.new

post '/log' do
  username = params[:username]
  session[:username] = username
  password = params[:password]
  session[:userdata] = loginEngine.login(username,password)
  if session[:userdata] == true
    redirect to "/profil"
  elsif session[:userdata] == "new user"
    redirect to "/newuser"
  else
    redirect to "/login"
  end

end

post '/logout' do
  session[:userdata] = false
  redirect to "/login"
end


get '/profil' do
  if session[:userdata]
  erb :profil
  else redirect to "/login"
end
end

get '/newuser' do
  erb :newuser
end

post '/createprofil' do
  username = params[:username]
  password = params[:password]
  session[:userdata] = loginEngine.createprofil(username,password)
  redirect to "/login"
end
