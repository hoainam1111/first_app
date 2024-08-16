module Mastermind
  # mảng chứa các màu , freeze để tránh việc thay đổi phần tử mảng khi thực thi chương trình
  COLORS = %w[red green blue yellow orange purple].freeze 
  # độ dài mã
  CODE_LENGTH = 4
  # số lượt
  MAX_TURNS = 10
end
