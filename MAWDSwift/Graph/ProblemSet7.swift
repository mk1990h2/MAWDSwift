//
//  ProblemSet7.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/04.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

/**
 https://leetcode.com/problems/two-city-scheduling/
 */
func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var total = 0
    // [[index, diff]]
    var diff = [[Int]](repeating: [Int](repeating: 0, count: 2), count: costs.count)
    for i in 0..<costs.count {
        diff[i] = [i, costs[i][0] - costs[i][1]]
    }
    diff.sort { $0[1] < $1[1]}
    let mid = costs.count / 2
    for i in 0..<costs.count {
        if i < mid {
            total += costs[diff[i][0]][0]
        } else {
            total += costs[diff[i][0]][1]
        }
    }
    
    return total
}

/**
 https://leetcode.com/problems/gas-station/
 */
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var diff = [[Int]](repeating: [Int](repeating: 0, count: 2), count: gas.count)
    for i in 0..<gas.count {
        diff[i][0] = i
        diff[i][1] = gas[i] - cost[i]
    }
    
    diff.sort{ $0[1] > $1[1]}
    
    var i = 0
    while diff[i][1] >= 0 && i < gas.count{
        var id = diff[i][0]
        var remainedGas = 0
        while true {
            remainedGas += gas[id] - cost[id]
            if remainedGas < 0 {
                break
            }
            id = id + 1 == gas.count ? 0 : id + 1
            if id == diff[i][0] {
                return id
            }
        }
        i += 1
    }
    
    return -1
}

/**
 https://leetcode.com/problems/partition-labels/
 */
func partitionLabels(_ S: String) -> [Int] {
    let chars = Array(S)
    var result = [Int]()

    var partition = S.distance(from: S.startIndex, to: S.startIndex)
    // index starts from 0, so I need to add 1 to the fisrst group of letters
    var startIndex = -1
    for i in 0..<S.count {
        let lastIndex = S.distance(from: S.startIndex, to: S.lastIndex(of: chars[i])!)
        if lastIndex > partition {
            partition = lastIndex
        }
        if i == partition {
            result.append(partition - startIndex)
            startIndex = partition
        }
    }
    
    return result
}

/**
 https://leetcode.com/problems/course-schedule-iii/
 */
func scheduleCourse(_ courses: [[Int]]) -> Int {
    var deadlines = [[Int]](repeating: [Int](repeating: 0, count: 2), count: courses.count)
    for i in 0..<courses.count {
        deadlines[i][0] = i
        deadlines[i][1] = courses[i][1] - courses[i][0]
    }
    deadlines.sort{ $0[1] > $1[1] }

    // TODO
    
    

    
    return 0
}

