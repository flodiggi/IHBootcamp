class TextInspectionsController < ApplicationController
  def new
    render 'new'
  end

  def create
  @text = params[:text_inspection][:user_text]
  @array = @text.split(" ")
  @counter = {}
  @word_count = @text.split(" ").length.to_f
  @frequency = @array.each do |word|
    @counter[word] = 0 unless @counter.include?(word)
    @counter[word] += 1
  end

  @counter = @counter.sort_by {|key, value| value}.reverse


   render "results"

 end
end
