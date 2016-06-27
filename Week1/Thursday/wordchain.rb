require "pry"
require 'ruby-dictionary'

class WordChain
    def initialize(dictionary)
      # binding.pry
        @dictionary = dictionary
        @indexnumber = 0
    end

    def find_chain(input, output)
      splittedInput = input.split("")
      splittedOutput = output.split("")
      savearray = []
      puts splittedInput.join


      while splittedInput != splittedOutput
      savearray.push(splittedInput[@indexnumber])
      if splittedInput[@indexnumber] != splittedOutput[@indexnumber]
      splittedInput[@indexnumber] = splittedOutput[@indexnumber]
        if @dictionary.exists? splittedInput.join("")
            puts splittedInput.join
        else
          splittedInput[@indexnumber] = savearray[@indexnumber]
        end
      end
          @indexnumber = @indexnumber +1
          if @indexnumber >= splittedInput.length
            @indexnumber = 0
          end
      end
    end
end


dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("lead", "gold")
