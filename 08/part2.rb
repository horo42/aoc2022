#!/usr/bin/env ruby

$trees = File
    .readlines("input.txt", chomp: true)
    .map { |str| str.split("").map(&:to_i) }

$height = $trees.size
$width = $trees.first.size

def calcVerticalViewDist(height, x, range)
    viewDist = range.take_while { |y| $trees[y][x] < height }.size
    viewDist += viewDist == range.size ? 0 : 1
end

def calcHorizontalViewDist(height, y, range)
    viewDist = range.take_while { |x| $trees[y][x] < height }.size
    viewDist += viewDist == range.size ? 0 : 1
end

def calculateScenicScore(y, x)
    height = $trees[y][x]
    viewDistUp = calcVerticalViewDist(height, x, (y-1..0).step(-1))
    viewDistLeft = calcHorizontalViewDist(height, y, (x-1..0).step(-1))
    viewDistDown = calcVerticalViewDist(height, x, (y+1...$height))
    viewDistRight = calcHorizontalViewDist(height, y, (x+1...$width))
    [x, y, viewDistUp * viewDistDown * viewDistLeft * viewDistRight]
end

scores = (1..$width - 2).map { |x| (1..$height - 2).map { |y| calculateScenicScore(x, y) } }
p scores.flatten(1).max { |(_,_,a), (_,_,b)| a <=> b }
