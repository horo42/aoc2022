#!/usr/bin/env ruby

(input, ops) = File.read("input.txt").split("\n\n")
ops = ops.split("\n").map { |s| s.scan(/\d+/).map(&:to_i) }
l = input.split("\n").map { |l| (0..l.size).step(4).to_a.map { |n| l[n+1] } }
l.pop
stacks = [].fill(0, l[0].length) { [] }
l.reverse.each {
    |n| n.each_with_index { |m, i| m != " " ? stacks[i].push(m) : nil }
}

ops.each { |(num, from, to)| stacks[to - 1].push(*stacks[from - 1].pop(num)) }

p stacks.map { |s| s.last }.join
