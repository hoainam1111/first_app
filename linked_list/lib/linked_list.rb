require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next until current.next.nil?
      current.next = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end

  def delete(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next
      return
    end

    current = @head
    while current.next && current.next.value != value
      current = current.next
    end

    current.next = current.next.next if current.next
  end

  def display
    current = @head
    while current
      print "#{current.value} -> "
      current = current.next
    end
    puts "nil"
  end
end