require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize
    @board = Array.new(9, " ")
    #binding.pry
  end
  
  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end
 
 def input_to_index(user_input)
   user_input.to_i - 1
   
 end
 
 def move(index, player_token)
   @board[index] = player_token
    
 end
 
 def position_taken?(index)
((@board[index] == "X" || @board[index] == "O"))
 end
 
 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index) #---> ask about this
   
 end
 
 def turn_count
   @board.count{|token| token == "X" || token == "O"} #---> ask about this
   end
   
   def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end
 
 def turn 
   puts "Please enter 1-9"
   input = gets.strip
   index = input_to_index(input)
   char = current_player
   if valid_move?(index)
     move(index, char)
     display_board
   else
   turn
 end
 
 def won?
   WIN_COMBINATIONS.detect do|x|
@board[x[0]] == @board[x[1]] && @board[x[1]] == @board[x[2]]
 end
end
def full?
  @board.all?{|occupied| occupied != " "}
 end
 def draw?
   !(won?) && (full?) #---> ask about why this passes
 end
 
 def over?
   won? || full? || draw?
 end
 
 def winner
   WIN_COMBINATIONS.detect do|x|
   if (@board[x[0]]) == "X" && (@board[x[1]]) == "X" && (@board[x[2]]) == "X"
    return "X"
   elsif (@board[x[0]]) == "O" && (@board[x[1]]) == "O" && (@board[x[2]]) == "O"
    return "O"
   else 
     nil 
  end
end
end
end

def play
  while over? == false
  turn
end
if won?
  puts "Congratulations #{winner}!"
else draw?
puts "Cat's Game!"
end
end 
end
