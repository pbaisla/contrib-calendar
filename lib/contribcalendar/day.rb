require 'date'

class Day
  attr_reader :date, :count, :color

  def initialize(date, count, color)
    @date = Date.parse(date)
    @count = count
    @color = color
  end

end
