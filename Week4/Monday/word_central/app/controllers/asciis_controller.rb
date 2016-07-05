class AsciisController < ApplicationController
  def new
    render 'new'
  end

  def create
    @asciistext = params[:asciis][:user_input]
    a = Artii::Base.new
    @asciis = a.asciify(@asciistext)

    render "results"
  end
end
