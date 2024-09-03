require_relative "lib/hashmap"

test = HashMap.new()

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('moon', 'silver')


# p test.entries

# OVERWRITE
test.set('apple', 'green')

p test.entries

# p test.get("apple")
# puts "Keys: #{test.keys}"
# p test.remove("moon")
p test.length
# p test.clear
p test.keys
# puts "Values: #{test.keys}"

puts test.has?("mooneds")
puts test.has?("moon")