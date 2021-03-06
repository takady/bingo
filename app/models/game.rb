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
      create(numbers: shuffle_numbers.join(','))
    end

    def shuffle_numbers
      NUMBERS.values.flat_map(&:to_a).shuffle
    end

    def character_of(number)
      NUMBERS.select {|character, numbers| numbers.include?(number) }.keys.first
    end
  end

  def number_at(index)
    numbers_array.at(index)
  end

  def numbers_array
    numbers.split(',').map(&:to_i)
  end
end
