class MastermindView
  def initialize(game)
    @game = game
  end

  def help
    "Type 'guess <color> <color> <color> <color>' to guess. Typos will crash the program right now. The first number indicates you have the right color in that many spots. The second number indicates you have the right color in a wrong spot."
  end

  def prompt
    "'help' for help, colors are red green yellow blue magenta white"
  end

  def render
    output = ""
    @game.guesses.each do |guess|
      output += "|#{guess[:set].join('|')}|#{guess[:black]}|#{guess[:white]}|\n"
    end
    if @game.over
      if @game.won
        output += "You win!"
      else
        output += "You lose"
        output += "|#{@game.answer.join('|')}|"
      end
    else
      output += prompt
    end
    output
  end

  def reset_screen
    clear_screen
    move_to_home
  end

  def clear_screen
    print "\e[2J"
  end

  def move_to_home
    print "\e[H"
  end
end
