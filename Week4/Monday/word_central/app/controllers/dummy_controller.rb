class DummyController < ApplicationController
  def new
    render 'new'
  end

  def create
    @dummytext = "When in the Course of human events, it becomes necessary for one people to dissolve the political bands which have connected them with another, and to assume among the powers of the earth, the separate and equal station to which the Laws of Nature and of Nature's God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the separation."
    @amount = params[:number][:user_input].to_i
    @type = params[:type]
    if @type == "words"
    @splitted = @dummytext.split(" ").take(@amount)
    @output = @splitted.join(" ")
    else
    @output = @dummytext
    end
    render "results"
  end
end
