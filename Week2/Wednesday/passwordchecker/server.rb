require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './lib/models/passwordchecker.rb'

set :port, 3012
enable :sessions

get '/home' do
erb :home
end

checker = Passwordchecker.new

post '/log' do
  email = params[:email]
  session[:email] = email
  password = params[:password]

  session[:check] = checker.check_password(email,password)
  if session[:check] == true
    redirect to "/profil"
  else
    redirect to "/home"
  end

end


get '/profil' do
  if session[:check]
  erb :profil
else redirect to "/home"
end
end
