//
//  ProblemSet3.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/03.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation
func tomatoFarm() {
    struct Farm {
        let x: Int
        let y: Int
        let distance: Int
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    // process the input
    let firstLine = readLine()!.split(separator: " ")
    let m = Int(firstLine[0])! // width
    let n = Int(firstLine[1])! // hight
    
    // townMap (input)
    var farmMap = [[Int]]()
    var distances = [Int](repeating: -1, count: n*m)

    func bfs(x: Int, y: Int, n: Int) {
        let q = Queue<Farm>()
        q.enqueue(item: Farm(x: x, y: y, distance: 0))
        distances[(m * y) + x] = 0
        
        var visited = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        visited[y][x] = 1

        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            let distance = square.distance
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < m && ny >= 0 && ny < n {
                    if visited[ny][nx] != 1 {
                        visited[ny][nx] = 1
                        
                        let index = (m * ny) + nx
                        if farmMap[ny][nx] == -1 {
                            continue
                        }
                        if distances[index] == -1 {
                            distances[index] = distance + 1
                            q.enqueue(item: Farm(x: nx, y: ny, distance: distance + 1))
                        }
                        if distances[index] != -1 && distances[index] > distance {
                            distances[index] = distance + 1
                            q.enqueue(item: Farm(x: nx, y: ny, distance: distance + 1))
                        }
                    }
                }
            }
        }
    }

    // create the map
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        farmMap.append(row)
    }
    
    // loop all tomatos
    // if the tomato is ripe, calclate each distance to other tomatos which can be reached from the tomato
    for y in 0..<n {
        for x in 0..<m {
            if farmMap[y][x] == -1 {
                distances[(m * y) + x] = 0
            }
            if farmMap[y][x] == 1{
                bfs(x: x, y: y, n: n)
            }
        }
    }
    
    if distances.contains(-1) {
        print(-1)
    } else {
        distances.sort(by: >)
        print(distances[0])

    }
    
}


func Bridges() {
    struct Point {
        let x: Int
        let y: Int
        let distance: Int
        let color: Int
    }

    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    // process the input
    let n = Int(readLine()!)!

    // townMap (input)
    var islandMap = [[Int]]()
    var group = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var min = 10000

    func color(x: Int, y: Int, color: Int, n: Int) {
        let q = Queue<Point>()
        q.enqueue(item: Point(x: x, y: y, distance: 0, color: 0))
        group[y][x] = color
        
        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    // check if there's a house and not yet marked in group
                    if islandMap[ny][nx] == 1 && group[ny][nx] == 0 {
                        q.enqueue(item: Point(x: nx, y: ny, distance: 0, color: 0))
                        group[ny][nx] = color
                    }
                }
            }
        }
    }
    
    func bfs(x: Int, y: Int, n: Int) {
        let q = Queue<Point>()
        q.enqueue(item: Point(x: x, y: y, distance: 0, color: group[y][x]))
        var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        visited[y][x] = 1

        while !q.isEmpty() {
            let square = q.dequeue()!
            let x = square.x
            let y = square.y
            let distance = square.distance
            let color = square.color
            // check 4 directions
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                // check the bounds
                if nx >= 0 && nx < n && ny >= 0 && ny < n {
                    if visited[ny][nx] != 1 {
                        visited[ny][nx] = 1

                        if islandMap[ny][nx] == 1 {
                            if islandMap[y][x] == 1{
                                continue
                            }
                            if color == group[ny][nx] {
                                continue
                            }
                            if min > distance {
                                min = distance
                            }
                        }
                        if islandMap[ny][nx] == 0 {
                            q.enqueue(item: Point(x: nx, y: ny, distance: distance + 1, color: color))
                        }

                    }
                }
            }
        }
    }

    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        islandMap.append(row)
    }
    
    var colorId = 0
    for y in 0..<n {
        for x in 0..<n {
            if islandMap[y][x] == 1 && group[y][x] == 0{
                colorId += 1
                color(x: x, y: y, color: colorId, n: n)
            }
        }
    }

    for y in 0..<n {
        for x in 0..<n {
            if islandMap[y][x] == 1{
                bfs(x: x, y: y, n: n)
            }
        }
    }

    print(min)

}
