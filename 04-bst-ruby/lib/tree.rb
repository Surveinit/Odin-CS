require_relative "node"

class Tree
  attr_accessor :root
  def initialize(arr)
    sorted_uniq_arr = arr.sort.uniq
    @root = build_tree(sorted_uniq_arr, 0, sorted_uniq_arr.length - 1)
  end

  def build_tree(arr, start_idx = 0, end_idx = arr.length - 1)
      
    return nil if start_idx > end_idx
    mid_idx = (start_idx + end_idx) / 2
    root = Node.new(arr[mid_idx])

    root.left = build_tree(arr, start_idx, mid_idx-1)
    root.right = build_tree(arr, mid_idx+1, end_idx)

    return root
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end
    return node
  end

  def delete(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # Node with 1 or no child
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      # Node with 2 child
      min_larger_node = find_min(node.right)
      node.data = min_larger_node.data
      node.right = delete(min_larger_node.data, node.right)
    end

    return node
  end

  def find_min(node)
    current = node
    current = current.left while current.left
    return current
  end

  def find(value, node = @root)
    return nil if node.nil?

    if value < node.data
      node.left = find(value, node.left)
    elsif value > node.data
      node.right = find(value, node.right)
    else
      return node
    end
  end

  # BFS Shortest path
  def level_order(node = @root)
    return nil if node.nil?
    queue = []
    result = []

    queue << node
    while !queue.empty?
      current = queue.shift
      result << current.data
      queue << current.left if current.left != nil
      queue << current.right if current.right != nil
    end
    return result
  end

  # DFS start>>
  def inOrder(node = @root, result = [])
    return nil if node.nil?
    inOrder(node.left, result)
    result << node.data
    inOrder(node.right, result)
    
    return result
  end

  def preOrder(node = @root, result = [])
    return nil if node.nil?
    result << node.data
    preOrder(node.left, result)
    preOrder(node.right, result)
    
    return result
  end

  def postOrder(node = @root, result = [])
    return nil if node.nil?
    postOrder(node.left, result)
    postOrder(node.right, result)
    result << node.data
    
    return result
  end

  # DFS end>>

  def height(node = @root)
    return 0 if node.nil?
    left_height = height(node.left)
    right_height = height(node.right)
    return [left_height, right_height].max + 1
  end

  def depth(value, node = @root, curr_depth = 0)
    return -1 if node.nil?
    return curr_depth if node.data == value

    if value < node.data
      return depth(value, node.left, curr_depth += 1)
    elsif value > node.data
      return depth(value, node.right, curr_depth += 1)
    end
  end

  def balanced?
    return balanced_helper?(@root)
  end

  def balanced_helper?(node)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    difference = (left_height - right_height).abs

    if difference <= 1 && balanced_helper?(node.left) && balanced_helper?(node.right)
      return true
    else
      return false
    end
  end

  def rebalance
    values = inOrder(@root)
    uniq_arr = values.uniq
    @root = build_tree(uniq_arr)
  end


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end


# tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# puts tree.root.data
# tree.pretty_print

# puts ""
# puts "-"*20
# puts ""

# tree.insert(6)
# tree.delete(7)
# tree.pretty_print

# p tree.find(324)

# p tree.level_order
# p tree.inOrder
# p tree.preOrder
# p tree.postOrder

# puts "Height: #{tree.height}"
# puts "Depth: #{tree.depth(6345)}"
# p tree.balanced?

# p tree.rebalance