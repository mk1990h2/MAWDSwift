//
//  ProblemSet8.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/12.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

class ProblemSet8 {
    struct Edge {
      let to: Int
      let cost: Int
    }

    /**
     https://leetcode.com/problems/network-delay-time/
     */
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var adj = [[Edge]](repeating: [Edge](), count: N + 1)
        var dist = [Int](repeating: Int.max, count: N + 1)
        var check = [Bool](repeating: false, count: N + 1)

        for time in times {
          adj[time[0]].append(Edge(to: time[1], cost: time[2]))
        }
        
        // Dijkstra from source vertex 1
        dist[K] = 0
        
        for _ in 0..<N-1 {
            // the vertex of min value in dist
            var min = Int.max
            var u = 1
            for i in 1...N {
                if !check[i] && dist[i] < min {
                    min = dist[i]
                    u = i
                }
            }

            check[u] = true
            for edge in adj[u] {
                // relax edges
                let v = edge.to
                if dist[v] > dist[u] + edge.cost {
                    dist[v] = dist[u] + edge.cost
                }
            }
        }
        
        dist.remove(at: 0)
        
        let max = dist.max()!
        if max == Int.max {
            return -1
        } else {
            return max
        }
        
    }
    
    /**
     https://leetcode.com/problems/cheapest-flights-within-k-stops/
     */
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var adj = [[Edge]](repeating: [Edge](), count: n)
        var dist = [[Int]](repeating: [Int](), count: n)
        var stops = [[Int]](repeating: [Int](), count: n)
        var check = [Bool](repeating: false, count: n)

        for flight in flights {
          adj[flight[0]].append(Edge(to: flight[1], cost: flight[2]))
        }
        
        // Dijkstra from source vertex 1
        dist[src].append(0)
        stops[src].append(0)
        
        for _ in 0..<n {
            // the vertex of min value in dist
            var u = 0
            for i in 0..<n {
                if !check[i] && !dist[i].isEmpty {
                    u = i
                }
            }

            check[u] = true
            for i in 0..<dist[u].count {
                for edge in adj[u] {
                    // relax edges
                    let v = edge.to
                    if v == src {
                        continue
                    }
                    if v == dst && stops[u][i] > K {
                        continue
                    } else if stops[u][i] > K {
                        continue
                    }
                    dist[v].append(dist[u][i] + edge.cost)
                    stops[v].append(stops[u][i] + 1)
                }
            }
        }
        
        let answer = dist[dst]
        if answer.isEmpty {
            return -1
        } else {
            return answer.min()!
        }
    }


}







