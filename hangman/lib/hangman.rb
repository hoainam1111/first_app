class Hangman
  attr_reader :word, :attempts_left, :guessed_letters, :results

  def initialize(word)
    @word = word
    @attempts_left = 6
    @guessed_letters = []
    @correct_letters = []
    @results = []
  end

  def display_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : "_" }.join(" ")
  end

  def guess_letter(letter)
    
    if @guessed_letters.include?(letter)
      @results << "Bạn đã đoán chữ '#{letter}' rồi."
    elsif @word.include?(letter)
      @correct_letters << letter
      @results << "Chính xác! Chữ '#{letter}' có trong từ."
    else
      @attempts_left -= 1
      @results << "Sai rồi! Chữ '#{letter}' không có trong từ."
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
