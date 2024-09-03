require_relative "lib/tree"

tree = Tree.new(Array.new(15) { rand(1..100) })
# p tree.balanced?

# p tree.level_order
# p tree.inOrder
# p tree.preOrder
# p tree.postOrder

tree.insert(101)
tree.insert(201)
tree.insert(301)

p tree.balanced?
tree.rebalance
p tree.balanced?

p tree.level_order
p tree.inOrder
p tree.preOrder
p tree.postOrder