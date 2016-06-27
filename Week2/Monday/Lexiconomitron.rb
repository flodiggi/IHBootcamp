class Lexiconomitron
  def eat_t(word)
    #course solution:
    # word.split('').select do |char|
    #   char.downcase != 't'
    # end.join
      word.gsub(/[t]/,"")
  end
  def shazam(words)
    words.map!(&:reverse!)
      [eat_t(words[0]), eat_t(words[-1])].map {|word| eat_t(word)}
    end

  def oompa_loompa(array)
    array.select { |word| word.length <= 3}.map {|word| eat_t(word)}
    end
end
