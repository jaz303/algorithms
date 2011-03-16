max = 0
val = 0

(3..1000).each do |p|
  puts "curr=#{p} (max=#{max / 2}, p=#{val})"
  triplets = 0
  1.upto(p - 2).each do |a|
    1.upto(p - a).each do |b|
      c = p - a - b
      hyp = nil
      # check triangle condition, and that one side is larger than the others
      if (a + b > c && a + c > b && b + c > a) && (c > b && c > a)
        triplets += 1 if c*c == a*a + b*b
      end
      if triplets > max
        max = triplets
        val = p
      end
    end
  end
end

puts "max triplets: #{max / 2}, for perimeter #{val}"