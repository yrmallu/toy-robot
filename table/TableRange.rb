class TableRange < Struct.new(:min, :max)
  def include?(point)
    (min..max).cover? point
  end
end
