require 'contribcalendar/day'

require 'nokogiri'
require 'open-uri'

class Calendar
  attr_reader :contributions

  def initialize(username)
    @contributions = []

    profile_page = Nokogiri::HTML(open("https://github.com/" + username))
    squares = profile_page.css("rect.day")

    squares.each do |square|
      @contributions << Day.new(square['data-date'], square['data-count'], square['fill'])
    end
  end

end
