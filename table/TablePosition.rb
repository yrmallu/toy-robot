class TablePosition
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def decrease_y(decrement)
    @y -= decrement
  end

  def increase_y(increment)
    @y += increment
  end

  def decrease_x(decrement)
    @x -= decrement
  end

  def increase_x(increment)
    @x += increment
  end
end
