class Question
  def choosequestiontype
    questions = ["year", "director", "cast_members"]
    i = rand(3)
    questions[i]
  end

  def choosequestion(movies, type)
    n = rand(9)
    movies[n][type.to_sym]
  end

  def phrasequestion(questiontype, keyword)
    if questiontype == "year"
      question = "Which movie was released in #{keyword}?"
    elsif questiontype == "director"
      question = "Which movie was directed by #{keyword}?"
    elsif questiontype == "cast_members"
      question = "Which movie features #{keyword}?"
    end
    question
  end

  def checkanswer(movies,questiontype,keyword)
    correctanswers = []
    movies.each do |movie|
      if movie[questiontype.to_sym] == keyword
        correctanswers.push(movie[:id])
      end
    end
    correctanswers
  end


end
