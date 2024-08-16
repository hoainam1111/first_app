require_relative 'mastermind'
require_relative 'codebreaker'

class Game
  include Mastermind

  def initialize
    @secret_code = Array.new(CODE_LENGTH) { COLORS.sample }
  end

  def play
    puts "Chào mừng đến với Mastermind!"
    puts "Hãy đoán mã bí mật gồm #{CODE_LENGTH} màu."
    puts "Các màu có sẵn: #{COLORS.join(', ')}"

    MAX_TURNS.times do |turn|
      guess = CodeBreaker.new.get_guess(turn + 1)
      result = check_guess(guess)
      if result[:exact] == CODE_LENGTH
        puts "Chúc mừng! Bạn đã giải mã: #{guess.join(' ')}"
        return
      else
        puts "Số lần đúng vị trí: #{result[:exact]}, Đúng màu nhưng sai vị trí: #{result[:color]}"
      end
    end

    puts "Rất tiếc, bạn đã hết lượt. Mã bí mật là: #{@secret_code.join(' ')}"
  end

  private

  def check_guess(guess)
    exact = guess.each_with_index.count { |color, index| color == @secret_code[index] }
    # duyêt các phần tử trong mảng guess, đếm các màu trong guess tại vị trí index khớp với màu trong secret_code tại vị trí đấy
    color = guess.uniq.count { |color| @secret_code.include?(color) } - exact
    # uniq để loại bỏ các màu trùng lặp trong guess , đếm số mài trong guess có mặt trong secret_code, - exact để biết số màu đúng nhưng sai vị trí
    { exact: exact, color: color }
  end
end
