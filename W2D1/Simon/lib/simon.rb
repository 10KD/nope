class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "Starting simon.."
    sleep 2
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
      system('clear')
      show_sequence
      require_sequence

      unless game_over
        round_success_message
        system('clear')
        @sequence_length += 1
      end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1
      system("clear")
      sleep 1
    end
  end

  def require_sequence
    puts "repeat to me the sequence, one color at a time (your options are R,G,B or Y)"
    @seq.each do |color|
      guess = gets.chomp.downcase
      if color[0] != guess
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You're correct! well done."
  end

  def game_over_message
    puts "Wrong guess! Game over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end


if __FILE__ == $PROGRAM_NAME
  simon = Simon.new
  simon.play
end
