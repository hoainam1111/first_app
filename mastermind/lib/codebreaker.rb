require_relative 'mastermind'

class CodeBreaker
  include Mastermind

  def get_guess(turn)
    loop do
      print "Lượt #{turn}: Nhập dự đoán của bạn (các màu cách nhau bằng dấu cách): "
      guess = gets.chomp.split
      return guess if valid_guess?(guess)

      puts "Dự đoán không hợp lệ. Vui lòng nhập đúng #{CODE_LENGTH} màu từ #{COLORS.join(', ')}."
    end
  end

  private

  def valid_guess?(guess)
    guess.length == CODE_LENGTH && guess.all? { |color| COLORS.include?(color) }
  end
end
