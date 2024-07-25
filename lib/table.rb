class Table
  def initialize
    # tạo bảng , sử dụng Array.new(3){Array.new(3),''} để mỗi phần tử trong mảng là độc lập, khi thay đổi 1 giá trị sẽ k ảnh hưởng các hàng khác
    @board = Array.new(3){Array.new(3),''}
  end
  def print_board
    puts "  1 2 3 "
    @board.each_with_index do |row, index|
      # in ra mỗi hàng của bàn cờ
      puts " #{index + 1} #{row.join("|")} "
      #ngăn cách bỏi dấu ----- trừ dòng cuối cùng
      puts "   ----" unless index == 2
    end
    puts "\n"
  end
  def get_board
    @board
  end

  def update_board
    @board[row][col] = player
  end
  
  def board_full
    @board.flatten.none? {|cell| cell == ' '}
    # sử dùnhj flatten  để làm phẳng mảng 2 chiều thành 1 chiều
  end

end

