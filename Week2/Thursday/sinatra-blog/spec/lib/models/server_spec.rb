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
    it "posts blogs" do
      get '/'

      expect(last_response.body).to include("text of post 1")
    end
  end
end
