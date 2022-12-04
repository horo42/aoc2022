#!/usr/bin/env ruby

count = File
    .read("input.txt")
    .split("\n")
    .map { |str|
        parts = str.split(",")
        parts.map { |part| part.split("-").map(&:to_i) }
    }
    .map { |(a, b)|
        (b[0].between?(*a) and b[1].between?(*a)) or
        (a[0].between?(*b) and a[1].between?(*b))
    }
    .count { |v| v }

print count
