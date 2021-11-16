require './tic_tac_toe_helper'
require 'byebug'

describe TicTacToeHelper do
  class DummyTestClass
    include TicTacToeHelper
  end

  let!(:dummy_test_class) { DummyTestClass.new }

  describe 'initialise_accumulator' do
    it 'initialise array with given size' do
      initialised_array = dummy_test_class.initialise_accumulator(10)
      expect(initialised_array.size).to eq(10)
    end
  end

  describe 'get_current_player_value' do
    it 'returns player value for x' do
      player_value = dummy_test_class.get_current_player_value('x')
      expect(player_value).to eq(1)
    end

    it 'returns player value for o' do
      player_value = dummy_test_class.get_current_player_value('o')
      expect(player_value).to eq(-1)
    end

    it 'returns nil player value if not present' do
      player_value = dummy_test_class.get_current_player_value('o')
      expect(player_value).to eq(-1)
    end
  end

  describe 'accumulate' do
    it 'accumulates given value' do
      value = dummy_test_class.accumulate.call(1, 2)
      expect(value).to eq(3)
    end
  end

  describe 'matches_value?' do
    it 'returns true if two values are same' do
      value = dummy_test_class.matches_value?.call(1, 1)
      expect(value).to eq(true)
    end

    it 'returns false if two values are different' do
      value = dummy_test_class.matches_value?.call(1, 2)
      expect(value).to eq(false)
    end
  end

  describe 'is_diagonal?' do
    it 'returns true if two values are same' do
      value = dummy_test_class.is_diagonal?(1, 1)
      expect(value).to eq(true)
    end

    it 'returns false if two values are different' do
      value = dummy_test_class.is_diagonal?(1, 2)
      expect(value).to eq(false)
    end
  end
end
