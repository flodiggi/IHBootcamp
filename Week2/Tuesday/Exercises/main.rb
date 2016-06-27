require 'sinatra'
require 'sinatra/reloader'
get '/' do
  'this is my super web app'
end

get '/about' do
  erb :about
end


get '/hi' do
  @name = 'Flo'
  erb :hi
end

get '/time' do
  @time = Time.now
  erb :time
end

get '/fruits' do
  @fruits = %w(oranges lemons apples)
  erb :fruits
end

get '/users/:username' do
  @username = params[:username]
  erb :user
end


get '/hours/ago/:number' do
  @number = params[:number]
  erb :hours
end
