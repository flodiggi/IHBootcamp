require 'colorize'
class Userlogin
  attr_accessor :username, :password
  def initialize (username, password)
    @username = username
    @password = password
    @functions = ["countwords", "countletters"]
    @passwordentry = 0
    # @thingsyoucandofirst = [{:cw => "countword"}]
    # @thingsyoucando = ["count words --> 'cw'", "count letters --> 'cl'","reverse the text --> 'rt'","convert to uppercase --> 'cu'","convert to lowercase --> 'cl'"]
  end

  def checkuserinput
    if @passwordentry == 3
      puts "Unfortunately your account is blocked, please contact the customer service".colorize(:red)
    else
      checkuserpassword
    end
  end

  def checkuserpassword
    puts "Please type in your log in details"
    puts "Username:"
    user_name = gets.chomp
    puts "Password:"
    user_password = gets.chomp
    if
    user_name == @username && user_password == @password
    puts "You are logged in".colorize(:green)
    puts "put some text please"
    usertext = gets.chomp
    puts "Your word count is: #{usertext.split.size}"
    else
    puts "Your log in details are incorrect, please try again".colorize(:red)
    @passwordentry = @passwordentry +1
    checkuserinput
    end
  end

#   def countstuff
#     puts "What do you want to do?"
#     puts @thingsyoucandofirs
#     userinput = gets.chomp
#     callfunction(userinput)
#   end
#
#   def callfunction(function)
#     function
#   end
#
#
#   def countwords
#     puts "write something ..:"
#     usertext = gets.chomp
#     puts "Your word count is: #{usertext.split.size}"
#   end
#   def countwords
#     puts "write something ..:"
#     usertext = gets.chomp
#     puts "Your word count is: #{usertext.split.size}"
#   end
end



my_password = Userlogin.new("flo","munich")
my_password.checkuserinput



# class Login
#
#   def initialize(user,password)
#     @users = {
#       :user => "albz",
#       :password => "letmein!"
#     }
#     @user = user
#     @password = password
#   end
#
#   def validate_login
#     return true if @user = @users[:user] && @password == @users[:password]
#   end
#
# end
#
# class AI
#   def self.powerful_algorithm
#     puts "Ask me anything you want. ANYTHING!"
#     input_string = gets.chomp
#     puts "Ok, the answer is:"
#     puts input_string.size
#   end
# end
#
# puts "Username:"
# user = gets.chomp
# puts "Password:"
# password = gets.chomp
#
# Login.new(user,password).validate_login == true ? AI.powerful_algorithm : puts("Incorrect!")
