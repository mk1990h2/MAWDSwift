//
//  Exercise.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/25.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

func connectedComponent() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    dfs(start: 1, visited: &visited, adjList: &adjList)
    
}

func countConnected(start: Int, visited: inout [Bool], adjList: inout [[Int]]) {
    visited[start] = true
    for v in adjList[start] {
        if !visited[v] {
            dfs(start: v, visited: &visited, adjList: &adjList)
        }
    }
}

func checkBipartiteGraph() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
    
    var visited = [Bool](repeating: false, count: n + 1)
    var colorList = [Int](repeating: 0, count: n + 1)
    let result = colorDfs(start: 1, visited: &visited, adjList: &adjList, colorList: &colorList, color: 1)
    print(result)
}

func colorDfs(start: Int, visited: inout [Bool], adjList: inout [[Int]], colorList: inout [Int], color: Int) -> Bool{
    visited[start] = true
    print(start)
    var result = true
    for v in adjList[start] {
        if colorList[v] != 0 && colorList[v] != color {
            return false
        }
        if !visited[v] {
            colorList[v] = color
            let newColor = color == 1 ? 2 : 1
            result = colorDfs(start: v, visited: &visited, adjList: &adjList, colorList: &colorList, color: newColor)
        }
        if !result {
            break
        }
    }
    return result
}

//4 4
//1 2
//2 3
//3 4
//4 2

//3 2
//1 3
//2 3

