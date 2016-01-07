require "contribcalendar/calendar"
require "contribcalendar/version"
require "rmagick"

module Contribcalendar
  include Magick

  module_function

  def make_wallpaper(username, destination)
    calendar = Calendar.new(username)

    wallpaper = Image.new(1600, 900)

    ttext = "Don't break the chain!"
    text = Draw.new
    text.font_family = 'helvetica'
    text.pointsize = 50
    text.gravity = NorthGravity
    text.annotate(wallpaper, 0,0,0,100, ttext)

    no_of_rows = 7
    no_of_columns = 53

    square_start_x = 270
    square_start_y = 450
    square_end_x = 286
    square_end_y = 466

    contributions = calendar.contributions

    square = Draw.new

    no_of_columns.times do |x|
      no_of_rows.times do |y|
        contribution = contributions.shift
        unless contribution.nil?
          square.stroke(contribution.color)
          square.fill(contribution.color)
          square.rectangle(square_start_x + x*20, square_start_y + y*20, square_end_x + x*20, square_end_y + y*20)
          square.draw(wallpaper)
        end
      end
    end

    wallpaper.write(File.join(destination, 'wallpaper.jpg'))

  end

end
