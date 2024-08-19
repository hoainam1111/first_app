require_relative 'lib/hashmap'

hash_map = HashMap.new

# Thêm các cặp key-value
hash_map.set("name", "Alice")
hash_map.set("age", 25)
hash_map.set("city", "Wonderland")

# Hiển thị HashMap
hash_map.display

# Lấy giá trị theo key
puts "Name: #{hash_map.get("name")}"  # Alice
puts "Age: #{hash_map.get("age")}"    # 25

# Cập nhật giá trị của key "age"
hash_map.set("age", 26)
puts "Updated Age: #{hash_map.get("age")}"  # 26

# Xóa một key
hash_map.delete("city")
hash_map.display  # Chỉ còn lại "name" và "age"
