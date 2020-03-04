//
//  SushiRestaurantReviews.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/27.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

var sushiMap = [[Int]]()

func findMinimalWay() {
    let first = readLine()!.split(separator: " ")
    let n = Int(first[0])!
    let m = Int(first[1])!
    sushiMap = [[Int]](repeating: [], count: n + 1)

    let realSushis = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    creadAdjList(n, &sushiMap)
    
    // BFS
    routeForRealSushi(n: n, m: m, realSushis: realSushis)

}

func routeForRealSushi(n: Int, m: Int, realSushis: [Int]) {
    var visited = [Bool](repeating: false, count: n)
    var depth = [Int](repeating: 0, count: n)
    var parent = [Int](repeating: 0, count: n)
    let queue = Queue<Int>()
    queue.enqueue(item: 0) // starting from vertex 1
        
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        for v in sushiMap[first] {
            if !visited[v] {
                queue.enqueue(item: v)
                visited[v] = true
                depth[v] = depth[first] + 1
                parent[v] = first
            }
        }
    }
    
    var minutes = 0
    // calculate how many minutes it takes in each pattern
    var current = [Int]()
    var sushiRoutePattern = [[Int]]()
    createSushiPattern(arr: realSushis, current: current, result: &sushiRoutePattern)

    
    print(minutes)
    
}

func createSushiPattern(arr: [Int], current: [Int], result: inout [[Int]]) {
    var newArr = current
    if arr.count == 1 {
        newArr.append(arr[0])
        result.append(newArr)
        return
    }
    for i in 0..<arr.count {
        newArr.append(arr[i])
        var tmp = arr
        tmp.remove(at: i)
        createSushiPattern(arr: tmp, current: newArr, result: &result)
    }
}

func findRoute(from: Int, to: Int, realSushiStack: Stack<Int>, minutes: inout Int) {
    var visited = [Bool](repeating: false, count: sushiMap.count)

//    while !realSushiStack.isEmpty() {
//        for i in 0..<sushiMap[from].count {
//            let next = sushiMap[from][i]
//            if visited[next] == false { // if not visited
//                minutes += 1 // update the distance
//                q.enqueue(item: next)
//                visited[next] = true // mark visited
//            }
//        }
//    }

    // if there are real sushi that is not visited
    // set it to the destination (depart from the last real sushi)

}


private func creadAdjList(_ n: Int, _ adjList: inout [[Int]]) {
    for _ in 0..<n-1 {
        let roads = readLine()!.split(separator: " ")
        let u = Int(roads[0])!
        let v = Int(roads[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
}
