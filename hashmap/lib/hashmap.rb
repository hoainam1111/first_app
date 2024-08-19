require_relative 'node'

class HashMap
  def initialize
    @buckets = Array.new(16)
  end

  def hash_key(key)
    key.hash % @buckets.length
  end

  def set(key, value)
    index = hash_key(key)
    node = @buckets[index]

    if node.nil?
      @buckets[index] = Node.new(key, value)
    else
      while node
        if node.key == key
          node.value = value
          return
        end
        node = node.next
      end
      new_node = Node.new(key, value)
      new_node.next = @buckets[index]
      @buckets[index] = new_node
    end
  end

  def get(key)
    index = hash_key(key)
    node = @buckets[index]

    while node
      return node.value if node.key == key
      node = node.next
    end

    nil
  end

  def delete(key)
    index = hash_key(key)
    node = @buckets[index]
    prev_node = nil

    while node
      if node.key == key
        if prev_node.nil?
          @buckets[index] = node.next
        else
          prev_node.next = node.next
        end
        return node.value
      end
      prev_node = node
      node = node.next
    end

    nil
  end

  def display
    @buckets.each_with_index do |node, index|
      next if node.nil?
      print "Bucket #{index}: "
      while node
        print "#{node.key} => #{node.value}  "
        node = node.next
      end
      puts
    end
  end
end