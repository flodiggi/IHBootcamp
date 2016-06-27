require './server'
require 'rspec'
require 'rack/test'


describe 'Server Service ' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      get '/'

      expect(last_response).to be_ok
      # expect(last_response.status).to eq(200)
    end
    it "Includes I'm home" do
      get '/'

      expect(last_response.body).to include("I'm home")
    end
  end

  describe 'GET /home' do
    it 'redirects to /' do
      get '/home'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end


end
