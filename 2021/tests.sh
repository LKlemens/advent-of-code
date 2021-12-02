#!/bin/bash
source "./assert.sh"

day=$1

function day1 () {
  part1=$(elixir day1.exs | head -1)
  assert_eq $part1 7 "not equivalent!"
  
  part2=$(elixir day1.exs | tail -1)
  assert_eq $part2 5 "not equivalent!"
}


eval $day
