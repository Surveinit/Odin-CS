class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize(value)
    new_node = Node.new(value)
    @head = new_node
    @tail = new_node
    @@length = 1
  end

  def self.length
    @@length
  end

  def print_list
    temp = @head
    while temp != nil
      p temp.value
      temp = temp.next_node
    end
  end

  def to_s
    result = ""
    temp = @head
    while temp != nil
      result += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    result += "nil"
    return result
  end

  def append(value)
    new_node = Node.new(value)
    if @@length == 0
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node    
    end
    @@length += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @@length == 0
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node    
    end
    @@length += 1
  end

  def at(index)
    if @@length == 0
      return "List is empty."
    else
      i = 0
      temp = @head
      while i < index and temp != nil
        temp = temp.next_node
        i += 1
      end
      return temp.value
    end
  end

  def pop
    if @@length == 0
      return "Nothing to pop"
    elsif @@length == 1
      @head = nil
      @tail = nil

    else
      prev = nil 
      curr = @head

      while curr != nil
        prev = curr
        curr = curr.next_node

        if curr == @tail
          @tail = prev 
          prev.next_node = nil
        end
      end 
      @@length -= 1
    
    end
  end

  def contains?(value)
    if @@length == 0
      return "List is empty."
    else
      temp = @head
      while temp != nil
        if temp.value == value
          return true
        end 
        temp = temp.next_node
      end
      return false
    end
  end

  def find(value)
    if @@length == 0
      return "List is empty."
    else
      i = 0
      temp = @head
      while temp != nil
        if temp.value == value
         return i
        end
        temp = temp.next_node
        i += 1
      end
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index == 0
      return prepend(value)
    else
      prev = nil 
      curr = @head

      i = 0
      while i < index 
        prev = curr
        curr = curr.next_node
        i += 1
      end
      prev.next_node = new_node
      new_node.next_node = curr

      @@length += 1
    
    end
  end

  def remove_at(index)
    prev = nil 
    curr = @head

    i = 0
    while i < index 
      prev = curr
      curr = curr.next_node
      i += 1
    end
    prev.next_node = curr.next_node
    curr.next_node = nil
    @@length -= 1
  
  end

end 


# list = LinkedList.new(4)
# list.append(5)
# list.append(6)

# list.prepend(3)
# list.prepend(2)

# list.print_list
 
# p list.at(4) 

# puts "After popping"
# list.pop()
# list.print_list

# p list.contains?(3)
# p list.contains?(31)

# p list.find(2) # 0
# p list.find(5) # 3

# puts list

# EXTRA CREDITS

# list = LinkedList.new(4)
# list.append(5)
# list.append(6)
# list.append(7)
# list.append(8)

# puts list

# # list.insert_at(3, 0)
# list.remove_at(2) #6
# puts list


# puts "\n--- List info ---"
# puts "     SIZE: #{LinkedList.length}"
# puts "     HEAD: #{list.head.value}"
# puts "     TAIL: #{list.tail.value}"