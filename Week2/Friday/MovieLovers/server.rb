require 'sinatra'
require 'sinatra/reloader'
require "./lib/search.rb"
require "./lib/question.rb"
require "pry"
enable :sessions

get "/" do
  rightanswers = 0
  wronganswers = 0
  erb :input
end

correct =[]
movies = []
rightanswers = 0
wronganswers = 0
inputword = ""

post "/input" do
  input = params[:input]
  inputword = input
  search = SearchMovie.new
  movies = search.search_movie(input)
  redirect to "/movielovers"
end

get "/movielovers" do
  @movies = movies
  qclass = Question.new
  @questiontype = qclass.choosequestiontype
  session[:type] = @questiontype
  @keyword = qclass.choosequestion(@movies,@questiontype)
  session[:key] = @keyword
  @question = qclass.phrasequestion(@questiontype,@keyword)
  @correctanswers = qclass.checkanswer(@movies,@questiontype,@keyword)
  correct = @correctanswers

  erb :publish


end



post "/answer" do
id = params[:id]
if correct.include? (id.to_i)
  @answer = "Correct"
  rightanswers += 1
else @answer = "Incorrect"
  wronganswers += 1
end
erb :answer
end



get "/finalresult" do
  @rightanswers = rightanswers
  @wronganswers = wronganswers
  @inputword = inputword
  erb :final
end
