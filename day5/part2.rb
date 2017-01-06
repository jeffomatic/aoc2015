input = File.open('./input') { |f| f.read }.strip.split("\n")

def nice?(s)
  last = ''
  lastlast = ''
  has_repeat_with_gap = false
  has_repeated_pair = false
  pairs = {}

  s.each_char.each_with_index do |c, i|
    if lastlast == c
      return true if has_repeated_pair
      has_repeat_with_gap = true
    end

    if !last.empty? && !has_repeated_pair
      k = [last, c]
      indexes = pairs[k] || []

      if !indexes.empty? && indexes.first < (i - 1)
        return true if has_repeat_with_gap
        has_repeated_pair = true
      end

      indexes << i
      pairs[k] = indexes
    end

    lastlast = last
    last = c
  end

  false
end

puts input.select { |s| nice?(s) }.count
