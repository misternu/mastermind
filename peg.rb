class Peg
  COLORS = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]

  def initialize(color)
    @color_index = COLORS.index(color)
  end

  def color
    COLORS[@color_index]
  end
end
