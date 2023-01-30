require_relative 'tic_tac_toe'


class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

 def initialize(board, next_mover_mark, prev_move_pos = nil)
   @board = board
   @next_mover_mark = next_mover_mark
   @prev_move_pos = prev_move_pos
   @children = []
 end


 def losing_node?(evaluator)
  if board.over?
    return board.won? && board.winner != evaluator
  end

  if evaluator == @next_mover_mark
    return true if self.children.all? { |child| child.losing_node?(evaluator) }
  end

  if evaluator != @next_mover_mark
    return true if self.children.any? { |child| child.losing_node?(evaluator) }
  end

  false

 end


 def winning_node?(evaluator)
  return true if self.board.won? && self.board.winner == evaluator 
  return false if self.board.won? && self.board.winner != evaluator

  if evaluator == @next_mover_mark
    return true if self.children.any? { |child| child.winning_node?(evaluator)}
  end

  if evaluator != @next_mover_mark
    return true if self.children.all? { |child| child.winning_node?(evaluator)}
  end

  false
 end


 # This method generates an array of all moves that can be made after
 # the current move.
 def children
  (0...3).each do |row|
    (0...3).each do |col|
      pos = [row, col]
      if @board.empty?(pos)
        new_board = @board.dup
        @new_mover_mark = :x if @new_mover_mark.nil?
        new_board[pos] = @new_mover_mark
        if @next_mover_mark == :x
          @next_mover_mark = :o
        else
          @next_mover_mark = :x
        end
        @prev_move_pos = pos

        @children << TicTacToeNode.new(new_board, @next_mover_mark, @prev_move_pos)
        
        if @next_mover_mark == :x
          @next_mover_mark = :o
        else
          @next_mover_mark = :x
        end
      end 
    end 
  end
  @children
  end

end