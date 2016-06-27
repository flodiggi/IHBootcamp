
require 'Date'
require "pry"

class Blog
    attr_reader :posts
    def initialize(posts = [])
    @posts = posts

    end

    def add_post(post)
      @posts.push(post)
      @posts = @posts.sort{|a,b| b.date <=> a.date}
    end
end

class Post
    attr_reader :title, :date, :author, :category, :text
    def initialize(title, date, author, category, text)
      @title = title
      @date = date
      @author = author
      @category = category
      @text = text
    end
    def publishingformat
      puts title
      puts "*******************"
      puts text
      puts "-------------------"
    end
end

class FeaturedPost < Post
  def publishingformat
    puts "************#{title}**********"
    puts "*******************"
    puts text
    puts "-------------------"
  end
end
