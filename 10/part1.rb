#!/usr/bin/env ruby

$signalStrengths = []
$cycle = $x = 1
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
    if $cycle >= 20 and ($cycle - 20) % 40 == 0 then
        $signalStrengths.push($cycle * $x)
    end
    $cycle += 1
end

p $signalStrengths.sum
