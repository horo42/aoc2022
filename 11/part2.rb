#!/usr/bin/env ruby

monkeys = File.read("input.txt")
    .split("\n\n")
    .map { |str| str.split("\n") }
    .map { |m| {
        "items" => m[1].scan(/\d+/).map(&:to_i),
        "operation" => m[2].split("new = old ")[1].split(" "),
        "divisibleBy" => m[3].scan(/\d+/)[0].to_i,
        "throw" => [m[4].scan(/\d+/), m[5].scan(/\d+/)].flatten.map(&:to_i),
        "inspectCount" => 0,
    } }

divProduct = monkeys.map { |m| m["divisibleBy"] }.reduce(&:*)

for i in 1..10000 do
    monkeys.each { |monkey|
        items = monkey["items"]
        monkey["items"] = []
        items.each { |item|
            monkey["inspectCount"] += 1
            operand = monkey["operation"][1] == "old" ? item : monkey["operation"][1].to_i
            case monkey["operation"][0]
            when "+"
                item = item + operand
            when "*"
                item = item * operand
            end

            if item % monkey["divisibleBy"] == 0 then
                monkeys[monkey["throw"][0]]["items"].push(item % divProduct)
            else
                monkeys[monkey["throw"][1]]["items"].push(item % divProduct)
            end
        }
    }
end

p monkeys.map { |m| m["inspectCount"] }.max(2).reduce(&:*)
