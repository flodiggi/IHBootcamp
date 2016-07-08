require 'imdb'

class MoviesController < ApplicationController

  def index
  end


  def search
    @movies = []
    @input = params[:movies][:input]
    result = Imdb::Search.new(@input)
    n = 0
      while @movies.size < 20
        if result.movies[n].poster != nil
          @movies.push ( {
                    imdbid: result.movies[n].id,
                    title: result.movies[n].title,
                    year: result.movies[n].year,
                    poster: result.movies[n].poster,
                    director: result.movies[n].director.first,
                    cast_members: result.movies[n].cast_members.first
                   })
        end
        n += 1
      end
      @movies
  end

  def discuss
    movie = Imdb::Movie.new(params[:imdbid])
    @movie = Movie.new(imdbid: movie.id, title: movie.title, poster: movie.poster)
    @movie.save
    @comments = Comment.all
  end

end
