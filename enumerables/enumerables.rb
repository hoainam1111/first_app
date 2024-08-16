module CustomEnumerable
  # Duyệt qua từng phần tử của đối tượng và truyền nó vào khối lệnh (block).
    def my_each
      for element in self
        yield(element)
      end
      self
    end
  # Tạo một mảng mới và áp dụng khối lệnh cho từng phần tử của đối tượng, rồi lưu kết quả 
    def my_map
      result = []
      self.my_each do |element|
        result << yield(element)
      end
      result
    end
  # Tạo một mảng mới chứa các phần tử thỏa mãn điều kiện trong khối lệnh.
    def my_select
      result = []
      self.my_each do |element|
        result << element if yield(element)
      end
      result
    end
  # Kiểm tra nếu tất cả các phần tử trong đối tượng thỏa mãn điều kiện trong khối lệnh. trả về true nếu tất cả phần tử thỏa mãn
    def my_all?
      self.my_each do |element|
        return false unless yield(element)
      end
      true
    end
  # Kiểm tra nếu không có phần tử nào trong đối tượng thỏa mãn điều kiện trong khối lệnh, trả về trưe nếu k phần tử nào thỏa mãn
    def my_none?
      self.my_each do |element|
        return false if yield(element)
      end
      true
    end
  # Đếm số phần tử trong đối tượng thỏa mãn điều kiện trong khối lệnh.
    def my_count
      count = 0
      self.my_each do |element|
        count += 1 if yield(element)
      end
      count
    end
  end
  