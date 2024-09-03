class HashMap
  attr_reader :bucket
  def initialize()
    @bucket = Array.new(16) { [] }
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code += prime_number * hash_code + char.ord}
    return hash_code
  end

  def set(key, value)
    index = hash(key) % 16
    bucket = @bucket[index]

    pair = bucket.find { |k, _| k == key }
    if pair
      pair[1] = value
    else
      bucket << [key, value]
      @length += 1
    end
  end

  def get(key)
    index = hash(key) % 16
    bucket = @bucket[index]
    if bucket
      pair = bucket.find { |k,_| k == key}
      return pair[1]
    else
      return nil
    end
  end

  def has?(key)
    index = hash(key) % 16
    bucket = @bucket[index]

    pair = bucket.find { |k, _| k == key }
    if pair
      return true
    else
      return false
    end
  end

  def remove(key)
    index = hash(key) % 16
    bucket = @bucket[index]

    if bucket.nil? || bucket.empty?
      return nil
    else
      pair_index = bucket.find_index { |k, _| k == key }
      pair = bucket.delete_at(pair_index)
      @length -= 1
      return pair
    end
  end

  def length()
    return @length
  end

  def clear()
    @bucket.each_index{ |key| @bucket[key] = nil}
    @length = 0
  end

  def keys
    keys_arr = []
    @bucket.each do |bucket|
      bucket.each { |k,_| keys_arr << k}
    end
    return keys_arr
  end

  def values
    values_arr = []
    @bucket.each do |bucket|
      bucket.each { |_,v| values_arr << v}
    end
    return values_arr
  end

  def entries
    @bucket.each_with_index do |bucket, index|
      next if bucket.nil? || bucket.empty?

      bucket.each { |pair| puts "#{index}: #{pair.inspect}" }
    end
  end

end


# TESTING IGNORE -----------------------

# hash = HashMap.new()
# hash.set("sagar", "surve@gmail.com")
# hash.set("sagar", "surv3e@gmail.com")

# p hash.bucket
# p hash.get("sagar")
# p hash.get("ragas")

# p hash.has?("sagar")
# p hash.has?("ragas")

# p hash.remove("sagar")
# p hash.remove("ragas")

# p hash.bucket

# hash.set("vedastu", "vilankar@gmail.com") #2
# hash.remove("vedastu") #1
# p hash.length

# hash.clear
# p hash.bucket

# p hash.keys
# p hash.values
# p hash.entries