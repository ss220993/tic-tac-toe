# frozen_string_literal: true

module TicTacToeHelper
  DRAW_MATCH = 'draw'
  UNFINISHED_MATCH = 'unfinished'
  PLAYER_MAP = { x: 1, o: -1 }.freeze

  def initialise_accumulator(size)
    Array.new(size, 0)
  end

  def get_current_player_value(player)
    PLAYER_MAP[player.to_sym]
  end

  def accumulate
    ->(x, y) { x + y }
  end

  def matches_value?
    ->(x, y) { x == y }
  end

  def is_diagonal?(row, col)
    matches_value?.call(row, col)
  end
end
