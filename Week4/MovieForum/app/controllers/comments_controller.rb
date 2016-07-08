class CommentsController < ApplicationController
  def create
    imdbid = params[:comment][:movieid]
    comment = Comment.new(
      :username => params[:comment][:username],
      :text => params[:comment][:text],)
    comment.movie = Movie.find_by(imdbid,imdbid)

    if
    comment.username =~ /^$/ || comment.text=~ /^$/

    # redirect_to("/movies/discussion/#{imdbid}")
    else

    comment.save!
    @Comments = Comment.all

    redirect_to("/movies/discussion/#{imdbid}")
    end
  end
end
