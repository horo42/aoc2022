#!/usr/bin/env ruby

$screen = []
$cycle = 0
$x = 1
ops = File.readlines("input.txt", chomp: true).reverse

while not ops.empty? do
    (op, n) = ops.pop()&.split(" ")
    if op == "noop" or op == nil then
    elsif op == "_addx" then
        $x += n.to_i
        next
    elsif op == "addx" then
        ops.push("_addx " + n, nil)
    end

    # Tick
    $screen.push(($cycle % 40).between?($x - 1, $x + 1) ? "#" : " ")
    $cycle += 1
end

$screen.each_slice(40) { |slice| p slice.join() }
