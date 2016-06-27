
require 'pry'

class Board
  def initialize(board_size)
    @board_size = board_size
    @cell_dictionary = {}
    @xy_array = []
  end

  def create_board
    count = 0
    x_array = []
    y_array = []
    length = @board_size.times do
      x_array.push(count)
      y_array.push(count)
      count += 1
    end
    xy_array = []
    x_array.each do |x_number|
      y_array.each do |y_number|
        xy_array.push([x_number, y_number])
      end
    end
    @xy_array = xy_array

    dictionary = {}
    xy_array.each do |pair|
      temp_num = "#{pair[0]}, #{pair[1]}"
      dictionary[temp_num.to_sym] = Cell.new(0, pair)
    end
    @cell_dictionary = dictionary
  end

  def play
    new_dictionary = {}
    @cell_dictionary.each_key do |key|
      cell = @cell_dictionary[key]
      num_array = cell.cell_position
      # binding.pry
      array_done = check_neighbours(num_array)
      cell.neighbours = array_done
      state = cell.regenerate


      new_dictionary[key] = Cell.new(state, num_array)
    end
    @cell_dictionary = new_dictionary
    display_board
  end
  def create_living_cells(x, y)
    @cell_dictionary["#{x}, #{y}".to_sym] = Cell.new(1, [x,y])
  end


  def run_it
    z = 5
    a = 1 + z
    b = z
    c = 2 + z
    d = 3 + z
    e = 5 + z
      create_living_cells(b,b)
      create_living_cells(a,b)
      create_living_cells(c,b)
      create_living_cells(a,c)
      create_living_cells(c,a)

      # create_living_cells(1,1)
      # create_living_cells(2,2)
      # create_living_cells(3,3)
      # create_living_cells(4,4)
      # create_living_cells(5,5)
      #
      # create_living_cells(0,1)
      # create_living_cells(0,2)
      # create_living_cells(0,3)
      # create_living_cells(0,4)
      # create_living_cells(0,5)

      display_board
      sleep 1
      while 0 < 1
        play
        sleep 1
      end
  end

  def display_board
    system("clear")
    count = 0
    @xy_array.each do |pair|
      count += 1
      print @cell_dictionary["#{pair[0]}, #{pair[1]}".to_sym].state
      if count % @board_size == 0
        puts ""
      end
    end
  end

    def check_neighbours(position)
      x = position[0]
      y = position[1]
      neighbour_arr =
        [check_position(x - 1, y),
        check_position(x + 1, y),
        check_position(x, y - 1),
        check_position(x, y + 1),
        check_position(x - 1, y - 1),
        check_position(x - 1, y + 1),
        check_position(x + 1, y + 1),
        check_position(x + 1, y - 1)]
      neighbour_arr
    end

    def check_position(x, y)
      if @cell_dictionary["#{x}, #{y}".to_sym]
        cell = @cell_dictionary["#{x}, #{y}".to_sym]
        cell.state
      else
        0
      end
    end
end

class Cell
  attr_accessor :state, :cell_position, :neighbours
  def initialize(state, cell_position)
    @cell_position = cell_position
    @state = state # either 1 or 0 for alive or dead
    @neighbours = [] # an array that represents the surrounding cells
  end

  def regenerate
      value = @neighbours.reduce(0) {|sum, x| sum + x }
      if @state == 1
        case value
          when 0 then 0
          when 1 then 0
          when 2 then 1
          when 3 then 1
          else 0
        end
      else
        case value
          when 0 then 0
          when 1 then 0
          when 2 then 0
          when 3 then 1
          else 0
          end
        end
    end
end

board = Board.new(10)
board.create_board
board.run_it
