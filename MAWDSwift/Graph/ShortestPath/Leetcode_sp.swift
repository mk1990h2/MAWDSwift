//
//  Leetcode.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 3/5/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var chars = [Int](repeating: 0, count: 26)
  var maxCount = 0
  var maxFreq = 0
  for ch in tasks {
    let i = Int(ch.asciiValue!) - 65
    chars[i] += 1
  }
  
  // for each frequency of char
  for freq in chars {
    if freq == 0 { continue }
    if maxFreq < freq {
      maxFreq = freq
      maxCount = 1
    } else if maxFreq == freq {
      maxCount += 1
    }
  }
  
  let length = (n + 1) * (maxFreq - 1) + maxCount
  return length < tasks.count ? tasks.count : length
}


func canCompleteCircuitIntuitive(_ gas: [Int], _ cost: [Int]) -> Int {
  let numStations = gas.count
  var possibleStarts = [Int]()
  for i in 0..<numStations {
    if gas[i] >= cost[i] {
      possibleStarts.append(i)
    }
  }
  
  while !possibleStarts.isEmpty {
    var start = possibleStarts.remove(at: 0)
    
    var travelCount = numStations
    var fuel = 0
    while travelCount != 0 {
      let cost = cost[start]
      fuel += gas[start]
      if fuel < cost { break }
      fuel -= cost
      start = (start + 1) % numStations
      travelCount -= 1
    }
    
    if travelCount == 0 {
      return start
    }
  }
  
  return -1
}

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  let gas = gas.enumerated().map { $1 - cost[$0] }
  let numStations = cost.count
  var i = 0
  var fuelSoFar = 0
  var result = 0
  
  while i < gas.count * 2 - 1 {
    fuelSoFar += gas[i % numStations]
    if fuelSoFar < 0 {
      result = i + 1
      if result >= numStations {
        return -1
      }
      fuelSoFar = 0
    }
    i += 1
  }
  
  return result
}

func partitionLabels(_ S: String) -> [Int] {
  // get the rightmost index of each char
  var map = Dictionary<Character, Int>()
  for (i, ch) in S.enumerated() {
    map[ch] = i
  }
  var res = [Int]()
  var (start, end) = (0, 0)
  for (i, ch) in S.enumerated() {
    end = map[ch]! > end ? map[ch]! : end
    if i == end {
      res.append(end - start + 1)
      start = i + 1
    }
  }
  return res
}
