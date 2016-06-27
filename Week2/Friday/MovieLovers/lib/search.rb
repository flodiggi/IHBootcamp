require 'imdb'
require 'pry'

class SearchMovie

  def search_movie(input)
    movies = []
    result = Imdb::Search.new(input)
    n = 0
      while movies.size < 9
        if result.movies[n].poster != nil
          movies.push ( {
                    id: n,
                    title: result.movies[n].title,
                    year: result.movies[n].year,
                    poster: result.movies[n].poster,
                    director: result.movies[n].director.first,
                    cast_members: result.movies[n].cast_members.first
                   })
        end
        n += 1
      end
      movies
      # binding.pry
  end
end
