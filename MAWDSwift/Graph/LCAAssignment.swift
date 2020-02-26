//
//  LCAAssignment.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/25.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

func findLCA() {
    let firstLine = readLine()!
    // # of vertices
    let n = Int(firstLine)!
    var tree = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        tree[u].append(v)
        tree[v].append(u) // undirected graph
    }
    
    // BFS - Queue O(V + E)
    var visited = [Bool](repeating: false, count: n + 1)
    var depth = [Int](repeating: 0, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
    let queue = Queue<Int>()
    queue.enqueue(item: 1) // starting from vertex 1
    visited[1] = true
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        for v in tree[first] {
            if !visited[v] {
                queue.enqueue(item: v)
                visited[v] = true
                depth[v] = depth[first] + 1
                parent[v] = first
            }
        }
    }
    
    let m = Int(readLine()!)!
    for _ in 0..<m {
        let vertices = readLine()!.split(separator: " ")
        var vertex1 = Int(vertices[0])!
        var vertex2 = Int(vertices[1])!

        while depth[vertex1] != depth[vertex2] {
            if depth[vertex1] > depth[vertex2] {
                vertex1 = parent[vertex1]
            }
            if depth[vertex1] < depth[vertex2] {
                vertex2 = parent[vertex2]
            }

        }
        compare(vertex1: vertex1, vertex2: vertex2, parent: parent)

    }
}

func compare(vertex1: Int, vertex2: Int, parent: [Int]){
    if vertex1 == vertex2 {
        print(vertex1)
        return
    }
    if parent[vertex1] == parent[vertex2] {
        print(parent[vertex1])
        return
    }
    
    compare(vertex1: parent[vertex1], vertex2: parent[vertex2], parent: parent)
}

//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15

