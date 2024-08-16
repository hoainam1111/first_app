def merge_sort(array)
    # Điều kiện dừng: nếu mảng có 1 hoặc 0 phần tử thì nó đã được sắp xếp
    return array if array.length <= 1
  
    # Chia mảng thành hai nửa
    mid = array.length / 2
    left_half = array[0...mid]
    right_half = array[mid...array.length]
  
    # Đệ quy sắp xếp từng nửa
    sorted_left = merge_sort(left_half)
    sorted_right = merge_sort(right_half)
  
    # Gộp hai nửa đã sắp xếp lại với nhau
    merge(sorted_left, sorted_right)
  end
  
  def merge(left, right)
    sorted_array = []
    until left.empty? || right.empty?
      # So sánh phần tử đầu tiên của mỗi mảng và thêm phần tử nhỏ hơn vào mảng kết quả
      if left.first <= right.first
        # .shift để xóa ơhaanf tử khỏi mảng ban đầu
        sorted_array << left.shift
      else
        sorted_array << right.shift
      end
    end
  
    # Gộp các phần còn lại của mảng chưa trống vào mảng kết quả
    sorted_array.concat(left).concat(right)
  end
  

  array = [38, 27, 43, 3, 9, 82, 10]
  sorted_array = merge_sort(array)
  puts sorted_array.inspect
