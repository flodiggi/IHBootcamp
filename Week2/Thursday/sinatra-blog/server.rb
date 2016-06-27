require 'sinatra'
require 'sinatra/reloader'
require_relative "lib/models/sinatrablog.rb"
require "pry"


floblog = Blog.new
floblog.add_post Post.new("Hello I am Flo", Date.new(2016,1,5),"Florian", "Various", "text of post 1")
floblog.add_post Post.new("Post2", Date.new(2016,6,23), "Max", "Sports", "text of post 2")

get "/" do
  @floblog = floblog.posts
  erb :blogs
end

get "/:index" do
  index = params[:index].to_i
  @post = floblog.posts[index]
  erb :post
end


post '/new_post' do
  title = params[:title]
  text = params[:text]
  author = params[:author]
  category = params[:category]
  post = Post.new(title, Date.today, author, category, text)
  floblog.add_post(post)
  redirect ("/")
end
