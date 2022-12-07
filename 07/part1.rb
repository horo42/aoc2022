#!/usr/bin/env ruby

$cwd = []
$dirSizes = {}
File
    .readlines("input.txt", chomp: true)
    .each { |cmd|
        if cmd == "$ ls" then
        elsif cmd[0..3] == "$ cd"
            dir = cmd.scan(/\$ cd (.*)/)[0]
            if dir then
                case dir[0]
                when "/"
                    $cwd = ["/"]
                when ".."
                    $cwd.pop
                else
                    $cwd.push(dir[0])
                end
            end
        else
            size = cmd.scan(/(\d+) .*/)
            $dirSizes[$cwd.join("/")] ||= 0
            if not size.empty? then
                cwdCopy = $cwd.map(&:itself)
                while not cwdCopy.empty? do
                    $dirSizes[cwdCopy.join("/")] += size[0][0].to_i
                    cwdCopy.pop
                end
            end
        end
    }

sum = $dirSizes
    .select { |dir, size| size <= 100000 }
    .reduce(0) { |sum, (dir, size)| sum + size }

p sum
