require_relative 'peg'

class Mastermind
  attr_accessor :answer, :guesses, :max_guesses
  def initialize(answer = nil)
    @answer = answer || Array.new(4) { Peg.new }
    @guesses = []
    @max_guesses = 8
  end

  def guess(set)
    begin
      peg_set = set.map {|c| Peg.new(c)}
    rescue
      # One of the pegs had an argument error
      return false
    end
    intersect = (@answer|peg_set).flat_map do |s|
      [s]*[@answer.count(s), peg_set.count(s)].min
    end
    in_set = intersect.count
    in_pos = @answer.zip(peg_set).count {|a,b| a == b}
    @guesses << {set: peg_set, black: in_pos, white: in_set - in_pos}
  end

  def over
    @guesses.length >= @max_guesses || won
  end

  def won
    @answer == @guesses.last[:set]
  end
end
