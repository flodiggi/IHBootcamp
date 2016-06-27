require "Pry"
require 'colorize'
class GameofRooms
  attr_accessor :currentroomposition, :currentroom
  def initialize(currentroomposition= 2)
    @currentroomposition = currentroomposition
    @currentroom = "startingroom"
    @rooms = []
    @indexnumber = 0
    @inventory = []
    @currentobject = "no object"
    @answerchoices = "no choices"
    @spaceanswer = ""
  end
  def addroom(room)
    @rooms.push(room)
  end

  def menu(rooms)
    puts "Which exit do you chose (N,E,S,W)?".colorize(:green)
    userdirection = gets.chomp
    if userdirection.upcase == "EXIT GAME"
    exitgame
    elsif rooms[@indexnumber].door.include?(userdirection.upcase)
      puts "Ok lets move on"
      move(userdirection)
    else
      puts "Unfortunately there is no exit in your chosen direction, try again!".colorize(:red)
      menu(rooms)
    end
  end

  def startgame
    showmap
    puts "You are currently at the #{@currentroom}".colorize(:green)
    puts "In this space there is #{@currentobject} ".colorize(:green)
    menu(@rooms)
  end

  def exitgame
  end


  def searchroom(position)
      # binding.pry
    @rooms.each_with_index do |space, index|
     if space.position == position
       @currentroom = space.name
       @indexnumber = index
       @currentobject = space.object
       @answerchoices =space.choices
       @spaceanswers = space.answers
      #  indexnumber =
     end
    end
  end

  def showmap
    puts "Here is a map to help you navigate:".colorize(:blue)
    puts "The Cave ---------------- The Castle\n   ||                         ||   \nStarting Room  --------------deadly River \n                              ||   \nfinalroom ---------------- the open field"

  end


  def move(userdirection)
    if userdirection.upcase == "N"
      @currentroomposition = @currentroomposition + 1
    elsif userdirection.upcase == "S"
      @currentroomposition = @currentroomposition - 1
    elsif userdirection.upcase == "W"
      @currentroomposition = @currentroomposition - 3
    elsif userdirection.upcase == "E"
      @currentroomposition = @currentroomposition + 3
    end
    searchroom(currentroomposition)
    # @currentroom =
    puts "You are now at the #{@currentroom}".colorize(:green)
    puts "In this space there is #{@currentobject} ".colorize(:green)
    if @currentobject == "the princess"
      puts @answerchoices
      if @inventory.any? { |s| s.include?('princess') }
        puts "The princess is free now and since you have been so nice to her, she helps you to exit the last room.".colorize(:blue)
        puts "Well done, you have sucessfully mastered the GAMEOFROOMS!!!!!!!!!!!!!!!!".colorize(:yellow)
        exitgame
      else
        puts "Thats unfortunate, the princess doesnt seem to know you, or you havent treated her well, you have to start again".colorize(:red)
        @currentroomposition = 2
        @currentroom = "startingroom"
        @indexnumber = 0
        @inventory = []
        @currentobject = "no object"
        @answerchoices = "no choices"
        @spaceanswer = ""
        startgame
      end
    elsif @currentobject != "no object"
      puts "What do you want to do? "
      puts "#{@answerchoices}"
      useranswer = gets.chomp
      if
        useranswer.upcase.include? @spaceanswers
        puts "Yes, that's right!!".colorize(:green)
        #certainexceptions:
          if @spaceanswers == "pick".upcase
            @inventory.push("key")
            puts "key is added to inventory".colorize(:blue)
          elsif @spaceanswers == "rescue".upcase
            @inventory.push("princess")
            puts "Great stuff, hopefully she will return the favor in the future".colorize(:blue)
          elsif
              @currentroomposition == 4
              if @inventory.any? { |s| s.include?('key') }
                puts "you are now about to enter the final room!"
              else
                puts "Oh wait, you dont have a key yet....".colorize(:red)
                puts "Start again and find one before returning".colorize(:red)
                @currentroomposition = 2
                @currentroom = "startingroom"
                @indexnumber = 0
                @inventory = []
                @currentobject = "no object"
                @answerchoices = "no choices"
                @spaceanswer = ""
                startgame
              end
          end
        menu(@rooms)
      elsif useranswer.upcase == "EXIT GAME"
        exitgame
      else
        puts "No, that was wrong, unlucky!".colorize(:red)
        puts "...you are transferred back to the starting room, try again".colorize(:red)
        @currentroomposition = 2
        @currentroom = "startingroom"
        @indexnumber = 0
        @inventory = []
        @currentobject = "no object"
        @answerchoices = "no choices"
        @spaceanswer = ""
        startgame
      end
    else
      menu@rooms
    end
  end
end

class Space
  attr_reader :name, :door, :object, :position, :choices, :answers
  def initialize (name, door, object, position, choices, answers)
  @name = name.upcase
  @door = door
  @object = object
  @position = position.to_i
  @choices = choices
  @answers = answers.upcase
  end
end

game = GameofRooms.new
# rooms =[
game.addroom Space.new("Startingroom", ["N","E"], "no object","2","","nothing")
game.addroom Space.new("North Cave", ["E","S"], "a key","3","Ignore / pick it up", "pick")
game.addroom Space.new("castle", ["W","S"], "a princess","6", "Ignore / rescue from castle / leave castle ", "rescue")
game.addroom Space.new("deadlyriver", ["N","S","W"], "Hannibal the bear, guarding the bridge","5", "Hannibal is a very smart bear, you have to impress him with a smart answer.............What is the 12th prime number ?", "37")
game.addroom Space.new("openfield", ["W"], "a trapdoor","4","We cant really do anything, the trap door is locked. I wonder whether the trap door can be opened somehow? ('use ..')","use key")
game.addroom Space.new("finalhouse", ["N"], "the princess","1","Oh look who is here again, the princess.....I hope you treated her well the last time","nothing")


puts "Welcome to the Game of Rooms".colorize(:yellow)
puts "At any time you can exit with 'exit game'"
puts "HAVE FUN!!!!!!!"
game.startgame
