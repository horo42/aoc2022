#!/usr/bin/env ruby

trees = File
    .readlines("input.txt", chomp: true)
    .map { |str| str.split("").map(&:to_i) }

$height = trees.size
$width = trees.first.size
treesOnTheEdge = $height * 2 + $width * 2 - 4

def markNotVisibleTrees(row)
    max = 0
    row
        .take_while { |r| r <= 9 }
        .map { |r| ret = max < r ? max = r : -1; ret }
end

def mapToCoords(array)
    array.map.with_index { |row, y| row.map.with_index { |r, x| r > -1 && x > 0 && x < $width - 1 ? [y + 1, x] : nil } }
        .flatten(1)
        .compact
end

def mapToCoordsReverse(array)
    array.map.with_index { |row, y| row.reverse.map.with_index { |r, x| r > -1 && x > 0 && x < $width - 1 ? [y + 1, x] : nil } }
        .flatten(1)
        .compact
end

byRowLTR = mapToCoords(
    trees.slice(1, $height - 2).map { |row| markNotVisibleTrees(row) }
)

byRowRTL = mapToCoordsReverse(
    trees.slice(1, $height - 2).map { |row| markNotVisibleTrees(row.reverse) }
)

byColTTB = mapToCoords(
    trees.transpose.slice(1, $width - 2).map { |row| markNotVisibleTrees(row) }
).map(&:reverse)

byColBTT = mapToCoordsReverse(
    trees.transpose.slice(1, $width - 2).map { |row| markNotVisibleTrees(row.reverse) }
).map(&:reverse)

visibleTreesInside = (byRowLTR | byRowRTL | byColTTB | byColBTT).size

p treesOnTheEdge + visibleTreesInside
