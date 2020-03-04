//
//  ProblemSet6.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/04.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

/**
 https://leetcode.com/problems/course-schedule/
 */
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var indegree = [Int](repeating: 0, count: numCourses)
    var adjList = [[Int]](repeating: [Int](), count: numCourses)
    for edge in prerequisites {
        adjList[edge[0]].append(edge[1])
        indegree[edge[1]] += 1
    }
    
    var visited = [Bool](repeating: false, count: numCourses)
    let q = Queue<Int>()
    // initial state
    for course in 0..<numCourses {
        if indegree[course] == 0 {
            visited[course] = true
            q.enqueue(item: course)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        for v in adjList[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                visited[v] = true
                q.enqueue(item: v)
            }
        }
    }

    return !visited.contains(false)
}

/**
 https://leetcode.com/problems/course-schedule-ii/
 */
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var indegree = [Int](repeating: 0, count: numCourses)
    var adjList = [[Int]](repeating: [Int](), count: numCourses)
    for edge in prerequisites {
        adjList[edge[0]].append(edge[1])
        indegree[edge[1]] += 1
    }

    var visited = [Bool](repeating: false, count: numCourses)
    var result = [Int]()
    
    let q = Queue<Int>()
    // initial state
    for course in 0..<numCourses {
        if indegree[course] == 0 {
            visited[course] = true
            result.insert(course, at: 0)
            q.enqueue(item: course)
        }
    }
    
    // BFS
    while !q.isEmpty() {
        let x = q.dequeue()!
        for v in adjList[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                visited[v] = true
                result.insert(v, at: 0)
                q.enqueue(item: v)
            }
        }
    }

    if visited.contains(false) {
        return [Int]()
    }

    return result
}

