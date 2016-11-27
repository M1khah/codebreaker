module Codebreaker
  class Game
    ATTEMPTS = 5
    HINTS = 2
    attr_reader :attempts, :hints

    def initialize
        @secret_code = code_generator
        @attempts = ATTEMPTS
        @hints = HINTS
    end


    def code_checker(guess)
      return 'Game over' if @attempts == 0
      @attempts -= 1
      return '++++ - You win!' if guess == @secret_code
      marker(@secret_code.chars, guess.chars)
    end

    def hint
      return "You dont have hints" if @hints == 0
      @secret_code[rand(4)] if @hints > 0
      @hints -= 1
    end


    private

    def code_generator
      code = Array.new(4)
      code.map { |element| rand(1..6) }.join
    end

    def marker(code, guess)
      guess.each do |number|
        puts "-" if code.include?(number)
      end

      guess.each_with_index do |number,index|
        puts "+" if code[index] == number[index]
      end
    end
  end
end
