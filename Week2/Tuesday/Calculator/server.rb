require "sinatra"
require 'sinatra/reloader'
require 'yaml/store'
require_relative './engine.rb'
enable :sessions





get '/' do
  erb(:calculator)
end


post "/result" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation]
  engine = Engine.new
  result = engine.calc(first, second, operation)
  session[:a] = "#{result}"

  redirect to "/result2"

end

get '/result2' do
  @result2 = session[:a]
  erb :result2
end

@savedresults = []
def save(save_result)
  t = Time.now
  @save_result = save_result
  @savedresults.transaction do
    @savedresults[t] = @save_result
  end
end






post "/save" do
@savedresults = YAML::Store.new("results.yml")
save_result = params[:save_result]
if save_result == "save"
  save(session[:a].to_f)
end
redirect to "/saved"
end

get '/saved' do
  erb :saved
end
