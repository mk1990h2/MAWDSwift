//
//  Leetcode.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/26.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

/**
 https://leetcode.com/problems/friend-circles/
 */
func findCircleNum(_ M: [[Int]]) -> Int {
    var union = UF(M.count)
    for i in 0..<M.count {
        for j in 0..<M[i].count {
            if i != j && M[i][j] == 1 && !union.connected(i, j){
                union.union(i, j)
            }
        }
    }
    
    return union.count
}

/**
 https://leetcode.com/problems/redundant-connection/
 */
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
//    var adjList = [[Int]](repeating: [], count: edges.count + 1)
//
//    for edge in edges {
//        let u = edge[0]
//        let v = edge[1]
//        adjList[u].append(v)
//        adjList[v].append(u)
//    }
//
//    // BFS - Queue O(V + E)
//    var visited = [Bool](repeating: false, count: edges.count + 1)
//    var depth = [Int](repeating: 0, count: edges.count + 1)
//
//    let queue = Queue<Int>()
//    queue.enqueue(item: 1) // starting from vertex 1
//    visited[1] = true
//
//    while !queue.isEmpty() {
//        let first = queue.dequeue()!
//        for v in adjList[first] {
//            if visited[v] {
//                if depth[v] != depth[first] + 1 {
//                    return [v, first]
//                }
//            }
//            if !visited[v] {
//                queue.enqueue(item: v)
//                visited[v] = true
//                depth[v] = depth[first] + 1
//            }
//        }
//    }
//
    return edges[0]
}


/**
 https://leetcode.com/problems/longest-consecutive-sequence/
 */
//func longestConsecutive(_ nums: [Int]) -> Int {
//
//}

