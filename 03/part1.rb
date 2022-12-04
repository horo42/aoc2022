#!/usr/bin/env ruby

# print "a".ord # 97
# print "A".ord # 65

sum = File
    .read("input.txt")
    .split("\n")
    .map { |str|
        (str[0..str.length/2-1].chars.to_a.uniq & str[str.length/2..].chars.to_a.uniq).first
    }
    .map { |char| char.ord >= 97 ? char.ord - 96 : char.ord - 64 + 26 }
    .sum

print sum
