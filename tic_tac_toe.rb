require './tic_tac_toe_helper'
# frozen_string_literal: true
class TicTacToe
  include TicTacToeHelper
  INVALID_MOVE = ' '

  attr_accessor :board, :board_size, :total_moves

  def initialize(board)
    @board = board
    @board_size = board.size
    @row_sum = initialise_accumulator(board_size)
    @col_sum = initialise_accumulator(board_size)
    @diagonal_sum = 0
    @anti_diagonal_sum = 0
    @total_moves = 0
  end

  def winner
    board.each_with_index do |sub_board, curr_row|
      sub_board.each_with_index do |curr_board_value, curr_col|
        next if curr_board_value.eql?(INVALID_MOVE)

        @total_moves = accumulate.call(@total_moves, 1)
        curr_winnner_status = evaluate_current_move(curr_row, curr_col, curr_board_value)
        return curr_winnner_status unless curr_winnner_status.nil?
      end
    end
    get_final_match_status
  end

  private

  def evaluate_current_move(curr_row, curr_col, player)
    current_player = get_current_player_value(player)
    @row_sum[curr_row] = accumulate.call(@row_sum[curr_row], current_player)
    @col_sum[curr_col] = accumulate.call(@col_sum[curr_col], current_player)
    @diagonal_sum = accumulate.call(@diagonal_sum, current_player) if is_diagonal?(curr_row, curr_col)
    @anti_diagonal_sum = accumulate.call(@anti_diagonal_sum, current_player)if is_diagonal?((board_size - curr_row - 1), curr_col)
    player if is_current_player_won?(curr_row, curr_col)
  end

  def is_current_player_won?(curr_row, curr_col)
    matches_value?.call(@row_sum[curr_row].abs, board_size) ||
      matches_value?.call(@col_sum[curr_col].abs, board_size) ||
      matches_value?.call(@diagonal_sum.abs, board_size) ||
      matches_value?.call(@anti_diagonal_sum.abs, board_size)
  end

  def get_final_match_status
    total_moves == board_size * board_size ? DRAW_MATCH : UNFINISHED_MATCH
  end
end
