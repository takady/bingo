class Game < ApplicationRecord
  NUMBERS = {
    B: (1..15),
    I: (16..30),
    N: (31..45),
    G: (46..60),
    O: (61..75)
  }

  class << self
    def start
      create(numbers: NUMBERS.values.flat_map(&:to_a).shuffle.join(','))
    end
  end
end
