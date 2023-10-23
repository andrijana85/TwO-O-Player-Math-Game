require './player'
require './question'

class Game 
attr_accessor :player1, :player2, :current_player, :game_over

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    @game_over = false
  end

  def start_game
    while !@game_over
      puts "----- NEW TURN -----"
      question = Question.new
      puts "#{current_player.name}: #{question.generate_question}"
      answer = gets.chomp.to_i
      if !question.check_answer?(answer)
        current_player.lose_life
        puts "Incorrect! #{current_player.name} loses a life"
      else
        puts "Correct!"
      end
      puts "#{player1.to_s} , #{player2.to_s}"
      if !current_player.is_alive?
        @game_over = true
        puts "#{current_player.name} loses!"
      else
        switch_player
      end
    end
  end

  def switch_player
    if current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
  end



end