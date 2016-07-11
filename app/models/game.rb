class Game < ApplicationRecord
  NUMBERS = {
    B: (1..15),
    I: (16..30),
    N: (31..45),
    G: (46..60),
    O: (61..75)
  }.freeze
  MAX_INDEX = 74.freeze

  class << self
    def start
      create(numbers: NUMBERS.values.flat_map(&:to_a).shuffle.join(','))
    end
  end

  def numbers_array
    numbers.split(',')
  end

  def number_at(index)
    numbers_array.at(index).to_i
  end

  def character_of(number)
    NUMBERS.select {|character, numbers| numbers.include?(number) }.keys.first
  end

  def history(range)
    numbers_array[range]
  end

  def remaining_numbers(index)
    numbers_array[index..MAX_INDEX]
  end
end
