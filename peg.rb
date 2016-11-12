require 'colorize'

class Peg
  COLORS = ["red", "green", "yellow", "blue", "magenta", "white"]

  attr_reader :c_index
  def initialize(color = nil)
    if color
      @c_index = COLORS.index(color)
    else
      @c_index = rand(COLORS.length)
    end
  end

  def to_s
    colorize("*")
  end

  def colorize(string)
    return string.send(COLORS[@c_index])
  end

  def color
    COLORS[@c_index]
  end

  def ==(other_peg)
    @c_index == other_peg.c_index
  end

  def hash
    @c_index.hash ^ Peg.hash
  end

  alias_method :eql?, :==
end
