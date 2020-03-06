//
//  ProblemSet7-TaskScheduler.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/06.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

/**
 https://leetcode.com/problems/task-scheduler/
 */
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    if n == 0 {
        return tasks.count
    }

    // get count for each task
    var tasksCount = [Int](repeating: 0, count: 26)
    for task in tasks {
        let num = Int(task.asciiValue!) - 65
        tasksCount[num] += 1
    }
    tasksCount = tasksCount.filter{ $0 > 0 }
    tasksCount.sort{ $0 > $1 }
    let max = tasksCount[0]
    var freq = 1
    for i in 1..<tasksCount.count {
        if tasksCount[i] != max {
            break
        }
        freq += 1
    }

    let minReq = (max - 1) * (n + 1) + freq
    if minReq < tasks.count {
        return tasks.count
    }
    
    return minReq
}

/**
 It's not working
 */
//func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
//    if n == 0 {
//        return tasks.count
//    }
//
//    // get count for each task
//    var tasksCount = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)
//    for task in tasks {
//        let num = Int(task.asciiValue!) - 65
//        tasksCount[num][0] = num
//        tasksCount[num][1] += 1
//    }
//    tasksCount = tasksCount.filter{ $0[1] > 0 }
//    tasksCount.sort{ $0[1] > $1[1] }
//
//    var arr = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
//    for i in 0...n {
//        arr[i][0] = i
//    }
//    for i in 0..<tasksCount.count {
//        arr[0][1] += tasksCount[i][1]
//        arr.sort{ $0[1] < $1[1] }
//    }
//
//    arr.sort{
//        if $0[1] == $1[1] {
//            return $0[0] > $1[0]
//        }
//        return $0[1] > $1[1] }
//    let max = arr[0][1]
//    var total = 0
//
//    for i in 0...n {
//        if i == 0 {
//            total += max
//        } else if arr[i][1] == max{
//            total += max
//        } else {
//            total += max - 1
//
//        }
//    }
//    return total
//}

/**
 It works, but performance is tterrible
 */
//func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
//    if n == 0 {
//        return tasks.count
//    }
//
//    // get count for each task
//    var tasksCount = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 26)
//    for task in tasks {
//        let num = Int(task.asciiValue!) - 65
//        tasksCount[num][0] = num
//        tasksCount[num][1] += 1
//    }
//
//    tasksCount = tasksCount.filter{ $0[1] > 0 }
//    tasksCount.sort{ $0[1] > $1[1] }
//
//    var total = 0
//    var lastN = [Int?]()
//
//    // create the max number of groups which has n elements
//    while !tasksCount.isEmpty {
//        var index:Int? = nil
//        // pick the index which has largest amount
//        //    && not appeared in last n element
//        for i in 0..<tasksCount.count {
//            if lastN.contains(tasksCount[i][0]) {
//                continue
//            }
//            index = i
//            break
//        }
//
//        // store last n index
//        if let i = index {
//            tasksCount[i][1] -= 1
//            lastN.append(tasksCount[i][0])
//            if tasksCount[i][1] == 0 {
//                tasksCount.remove(at: i)
//            }
//            tasksCount.sort{ $0[1] > $1[1] }
//        } else {
//            lastN.append(nil)
//        }
//        if lastN.count > n {
//            lastN.remove(at: 0)
//        }
//        total += 1
//    }
//
//    return total
//}
