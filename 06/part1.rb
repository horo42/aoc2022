#!/usr/bin/env ruby

index = File
    .read("input.txt")
    .split("")
    .each_cons(4)
    .to_a.find_index { |a| a.uniq.size == 4 } + 4

print index
