class CommentsController < ApplicationController
  def create
    imdbid = params[:comment][:movieid]
    comment = Comment.new(
      :username => params[:comment][:username],
      :text => params[:comment][:text],)
    comment.movie = Movie.find_by(imdbid: imdbid)

    if
    comment.username =~ /^$/ || comment.text=~ /^$/

    # redirect_to("/movies/discussion/#{imdbid}")
    else
    id = comment.movie_id
    comment.save!
    @comments = Comment.where(movie_id:id )

    redirect_to("/movies/discussion/#{imdbid}")
    end
  end
end
