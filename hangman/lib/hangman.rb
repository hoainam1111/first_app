class Hangman
  attr_reader :word, :attempts_left, :guessed_letters

  def initialize(word)
    @word = word
    @attempts_left = 6
    @guessed_letters = []
    @correct_letters = []
  end

  def display_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : "_" }.join(" ")
  end

  def guess_letter(letter)
    if @guessed_letters.include?(letter)
      puts "Bạn đã đoán chữ này rồi."
    elsif @word.include?(letter)
      @correct_letters << letter
      puts "Chính xác!"
    else
      @attempts_left -= 1
      puts "Sai rồi!"
    end
    @guessed_letters << letter
  end

  def won?
    (@word.chars - @correct_letters).empty?
  end

  def lost?
    @attempts_left <= 0
  end
end
