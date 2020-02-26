//
//  TreeQuiz.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/21.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

//       1(root)
//    6    4
//  3     7  2
// 5
func whosMyParent() {
    let n = Int(readLine()!)!
    var tree = [Int](repeating: 0, count: n + 1)
    for _ in 1..<n {
        let nodeInfo = readLine()!.split(separator: " ").map{ String($0) }
        let input0 = Int(nodeInfo[0])!
        let input1 = Int(nodeInfo[1])!
        if tree[input0] == 0 && input0 != 1{
            tree[input0] = input1
        } else {
            tree[input1] = input0
        }
    }

    for e in tree {
        if e != 0 {
            print(e)
        }
    }
}

// route    distance
// 1-3      2
// 3-2      2
// 3-4      3
// 2-4      4
// 4-5      6
// 1-3-4-5  11
func diameter() {
    let n = Int(readLine()!)!
    // index: node
    // element[index]: index = distination, value = distance
    var tree = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

    for _ in 0..<n {
        let nodeInfo = readLine()!.split(separator: " ").map{ String($0) }
        let node = Int(nodeInfo[0])!
        var i = 1
        
        while Int(nodeInfo[i])! != -1 {
            let destination = Int(nodeInfo[i])!
            tree[node][destination] = Int(nodeInfo[i + 1])!
            i += 2
        }
    }

    // calculate the distance to each vertex
//    for i in 1..<n {
//        for j in i + 1...n {
//            if tree[i][j] != 0 {
//                tree = getDest(tree, from: i, target: j, distance: tree[i][j])
//            }
//        }
//    }
    for i in 1..<n {
        for j in i + 1...n {
            if tree[i][j] == 0 {
                tree = getDest(tree, from: i, target: j, distance: 0, next: i)
            }
        }
    }

    // find the largest distance
    var largest = 0
    for arr in tree {
        for e in arr {
            if e > largest {
                largest = e
            }
        }
    }
    
    print(largest)

}

func getDest(_ tree: [[Int]], from: Int, target: Int, distance: Int, next: Int) -> [[Int]]{
    
    // continue until it find the distance to the target
    var tree = tree
    for i in 1..<tree.count {
        if i == next {
            continue
        }
        if tree[next][i] != 0 {
            let distanceToI = tree[next][i]
            let newDistance = distance + distanceToI
            if next != target {
                if tree[from][next] == 0 || tree[from][next] > newDistance {
                    tree[from][next] = newDistance
                }
            }
            if target != i {
                tree = getDest(tree, from: from, target: target, distance: newDistance, next: i)
            }
        }
    }
    
    return tree
}
        
//func getDest(_ tree: [[Int]], from: Int, target: Int, distance: Int) -> [[Int]]{
//    var tree = tree
//    let targetArr = tree[target]
//    for i in target + 1..<tree.count {
//        if targetArr[i] != 0 {
//            let distanceToI = targetArr[i]
//            let newDistance = distance + distanceToI
//            tree[from][i] = newDistance
//            tree = getDest(tree, from: from, target: i, distance: newDistance)
//        }
//    }
//
//    return tree
//}
