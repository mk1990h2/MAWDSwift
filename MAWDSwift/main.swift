//
//  main.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/12.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

/**
Test for QuickSort
*/
//print(quickSort([1, 2, 3, 4, 5], <))
//print(quickSort([5, 2, 4, 1, 3], <))
//print(quickSort([1, 2, 3, 4, 5], >))
//print(quickSort([3, 1, 2, 5, 4], >))

/**
 Test for Bag
 */
//var nums = Bag<Int>()
//nums.add(item: 1)
//nums.add(item: 2)
//nums.add(item: 3)
//
//for num in nums {
//    print(num)
//}

/**
Test for Stack
*/
//var nums = Stack<Int>()
//nums.push(item: 1)
//nums.push(item: 2)
//nums.push(item: 3)
//print("nums: \(nums)")
//print("peek: \(nums.peek()!)")
//print("pop: \(nums.pop()!)")
//print("nums: \(nums)")
//
//print("loop")
//for num in nums {
//    print(num)
//}
//print("pop: \(nums.pop())")
//print("pop: \(nums.pop())")
//print("pop: \(nums.pop())")

/**
Test for Queue
*/
//var nums = Queue<Int>()
//nums.enqueue(item: 1)
//nums.enqueue(item: 2)
//nums.enqueue(item: 3)
//print("nums: \(nums)")
//print("peek: \(nums.peek()!)")
//print("dequeue: \(nums.dequeue()!)")
//print("nums: \(nums)")
//
//print("loop")
//for num in nums {
//    print(num)
//}


// File.swift
//let path2 = "/Users/mika_sato/Desktop"
//crawl(path: path2)
//var board = Board()
//solve8Queens(board: &board)

//7
//A B C
//B D .
//C E F
//E . .
//F . G
//D . .
//G . .

//treeTraversal()

//var childeren3 = [MultipleTreeNode<Int>]()
//var childeren1 = [MultipleTreeNode<Int>]()
//childeren3.append(MultipleTreeNode<Int>(val: 5))
//childeren3.append(MultipleTreeNode<Int>(val: 6))
//childeren1.append(MultipleTreeNode<Int>(val: 3, children: childeren3))
//childeren1.append(MultipleTreeNode<Int>(val: 2))
//childeren1.append(MultipleTreeNode<Int>(val: 4))
//
//var root = MultipleTreeNode<Int>(val: 1, children: childeren1)
//
//print(preorder(root))
//print(postorder(root))

//var left = BinaryTreeNode(2)
//var right = BinaryTreeNode(3)
//var root = BinaryTreeNode(1)
//
//print(preorderTraversal(root))

/**
Presentation
*/


//whosMyParent()
//checkBipartiteGraph()
//findLCA()
//print(findCircleNum([[1,1,0],[1,1,0],[0,0,1]]))
//print(findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]]))
//print(findRedundantConnection([[1,2],[1,3],[2,3]]))


//countCyclicPermutation()
//findRepeatingSequence()

//floodFill()

//findMinimalWay()

//tomatoFarm()

//Bridges()

//print(canFinish(2, [[1,0]]))
//print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))

//print(twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]]))

//print(leastInterval(["A","A","A","B","B","B"], 2)) // 8
//print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2)) // 16
//print(leastInterval(["A","A","A","A","A","B","B","B","C","C","C","D","D","D","E","E"], 2)) // 16

//print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))

//print(partitionLabels("ababcbacadefegdehijhklij")) //[9,8,7]
//print(partitionLabels("caedbdedda")) //[1, 9]

//print(scheduleCourse([[100, 200], [200, 1300], [1000, 1250], [2000, 3200]]))
//print(scheduleCourse([[5,5],[4,6],[2,6]]))

//mcf()

//nonDecreasingDigit()

//print(lengthOfLIS([10,9,2,5,3,7,101,18]))
//print(lengthOfLIS([10,9,2,5,3,4]))
//print(lengthOfLIS([4,10,4,3,8,9]))
//print(lengthOfLIS([-2,-1]))

let p = ProblemSet8()
//print(p.networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))

//print(p.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1)) // 200
//print(p.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)) // 500
//print(p.findCheapestPrice(5, [[4,1,1],[1,2,3],[0,3,2],[0,4,10],[3,1,1],[1,4,3]], 2, 1, 1))
//print(p.findCheapestPrice(4, [[0,1,1],[0,2,5],[1,2,1],[2,3,1]], 0, 3, 1))
//print(p.findCheapestPrice(5, [[0,1,5],[1,2,5],[0,3,2],[3,1,2],[1,4,1],[4,2,1]], 0, 2, 2)) // 7
print(p.findCheapestPrice(18,[[16,1,81],[15,13,47],[1,0,24],[5,10,21],[7,1,72],[0,4,88],[16,4,39],[9,3,25],[10,11,28],[13,8,93],[10,3,62],[14,0,38],[3,10,58],[3,12,46],[3,8,2],[10,16,27],[6,9,90],[14,8,6],[0,13,31],[6,4,65],[14,17,29],[13,17,64],[12,5,26],[12,1,9],[12,15,79],[16,11,79],[16,15,17],[4,0,21],[15,10,75],[3,17,23],[8,5,55],[9,4,19],[0,10,83],[3,7,17],[0,12,31],[11,5,34],[17,14,98],[11,14,85],[16,7,48],[12,6,86],[5,17,72],[4,12,5],[12,10,23],[3,2,31],[12,7,5],[6,13,30],[6,7,88],[2,17,88],[6,8,98],[0,7,69],[10,15,13],[16,14,24],[1,17,24],[13,9,82],[13,6,67],[15,11,72],[12,0,83],[1,4,37],[12,9,36],[9,17,81],[9,15,62],[8,15,71],[10,12,25],[7,6,23],[16,5,76],[7,17,4],[3,11,82],[2,11,71],[8,4,11],[14,10,51],[8,10,51],[4,1,57],[6,16,68],[3,9,100],[1,14,26],[10,7,14],[8,17,24],[1,11,10],[2,9,85],[9,6,49],[11,4,95]], 7, 2, 6)) // 169



   
