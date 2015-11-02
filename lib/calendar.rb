require './day'

require 'nokogiri'
require 'open-uri'
require 'rmagick'

include Magick

class Calendar
  attr_reader :contributions

  @@no_of_rows = 7
  @@no_of_columns = 53

  def initialize(username)
    @contributions = []

    profile_page = Nokogiri::HTML(open("https://github.com/" + username))
    squares = profile_page.css("rect.day")

    squares.each do |square|
      @contributions << Day.new(square['data-date'], square['data-count'], square['fill'])
    end
  end

  def make_wallpaper
    @wallpaper = Image.new(1600, 900)

    square_start_x = 270
    square_start_y = 450
    square_end_x = 286
    square_end_y = 466

    contributions = @contributions.clone

    square = Draw.new

    @@no_of_columns.times do |x|
      @@no_of_rows.times do |y|
        contribution = contributions.shift
        unless contribution.nil?
          square.stroke(contribution.color)
          square.fill(contribution.color)
          square.rectangle(square_start_x + x*20, square_start_y + y*20, square_end_x + x*20, square_end_y + y*20)
          square.draw(@wallpaper)
        end
      end
    end

    @wallpaper.write('../wallpaper.jpg')
  end

end
