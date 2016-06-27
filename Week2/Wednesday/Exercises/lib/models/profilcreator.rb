require 'pry'
require_relative 'loginEngine.rb'


class ProfilCreator
  attr_accessor :users
  def initialize
    @users
  end

  def createprofil(username, password)
    @users[username.to_s] = password
    binding.pry
  end
end


neu = ProfilCreator.new
neu.createprofil("max", "berlin")






#   attr_accessor :users
#   def initialize
#   @users = {
#     :flo  =>  "munich"}
#   end
#
#  def login(username, password)
#          if @users.has_key?(username.to_sym)
#            if @users[username.to_sym] == password
#              return true
#            else
#              return false
#            end
#          else
#             return "new user"
#          end
#   end
# end
