class Player
  attr_accessor :name, :points

  def initialize(name)
    @name = name
    @points = 0
  end

  def show_state
    puts "#{@name} a #{@points} point(s)"
  end

  def win_point
    @points += 1
  end
end
