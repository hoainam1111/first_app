require_relative 'table'
require_relative 'player'

class Game 
  def initialize
    @table = Table.new #khởi tạo bản cờ
    @players = [Player.new('X'), Player.new('O')] #khởi tạo người chơi
    @current_player_index = 0
  end

  def play_game
    loop do
      @table.print_board #in bàn cờ
      current_player = @players[@current_player_index] #người chơi hiện tại
      puts "Player #{current_player.symbol}, enter your move (row[1-3] column[1-3]): "
      move = gets.chomp
      if valid_move?(move)
        # chia chuỗi move thành mảnh các phần tử ngăn cahcs bởi dấu,
        row, col = move.split(',').map { |x| x.to_i - 1 }
        @table.update_board(row, col, current_player.symbol)
        if check_win(current_player.symbol)
          @table.print_board
          puts "Player #{current_player.symbol} wins!"
          break
        elsif @table.board_full?
          @table.print_board
          puts "Draws"
          break
        else
          switch_players
        end
      else
        puts "invalid move"
      end
    end
  end
 
  private
  def valid_move?(move)
    move =~  /^[1-3],[1-3]$/ && @table.get_board[move[0].to_i - 1][move[2].to_i - 1] == ' '
  end

  def check_win(symbol)
    board = @table.get_board

    # Kiểm tra các hàng ngang và hàng dọc
    (0..2).each do |i|
      return true if board[i].all? { |cell| cell == symbol }  # Kiểm tra hàng ngang
      return true if board.all? { |row| row[i] == symbol }   # Kiểm tra hàng dọc
    end

    # Kiểm tra hai đường chéo
    return true if (0..2).all? { |i| board[i][i] == symbol }  # Kiểm tra đường chéo chính
    return true if (0..2).all? { |i| board[i][2 - i] == symbol }  # Kiểm tra đường chéo phụ

    false  # Trả về false nếu không có người chiến thắng
  end

  def switch_players
    @current_player_index = (@current_player_index + 1) % 2
  end
end

