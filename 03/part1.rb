#!/usr/bin/env ruby

# print "a".ord # 97
# print "A".ord # 65

sum = File
    .readlines("input.txt")
    .map { |str| (str[0..str.length/2-1].chars.uniq & str[str.length/2..].chars.uniq).first }
    .map { |char| char.ord >= 97 ? char.ord - 96 : char.ord - 64 + 26 }
    .sum

print sum
