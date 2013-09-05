require './lib/table/TableRange'

class TableTop
  attr_accessor :width, :height

  #-1 because we start at 0, 5 wide is 0 to 4
  def initialize(width = 5, height = 5)
    @width = TableRange.new(0,width-=1)
    @height = TableRange.new(0,height-=1)
  end

  # @param TablePosition x
  def position_on_table?(table_position)
    @width.include?(table_position.x) && @height.include?(table_position.y)
  end
end
