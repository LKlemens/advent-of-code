#!/bin/bash
source "./assert.sh"

if [[ $# == 0 ]]; then
  echo "Choose day!"
  exit 1
fi

day=$1

function day1 () {
  part1=$(elixir day1.exs | head -1)
  assert_eq $part1 7 "not equivalent!"
  
  part2=$(elixir day1.exs | tail -1)
  assert_eq $part2  5 "not equivalent!"
}

function day2 () {
  part1=$(elixir day2.exs | head -1)
  assert_eq $part1 150 "not equivalent!"
  
  part2=$(elixir day2.exs | tail -1)
  assert_eq $part2  900 "not equivalent!"
}

function day3 () {
  part1=$(elixir day3.exs | head -1)
  assert_eq $part1 198 "not equivalent!"
  
  # part2=$(elixir day3.exs | tail -1)
  # assert_eq $part2  900 "not equivalent!"
}

eval $day
