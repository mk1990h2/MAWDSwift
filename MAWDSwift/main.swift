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
var nums = Queue<Int>()
nums.enqueue(item: 1)
nums.enqueue(item: 2)
nums.enqueue(item: 3)
print("nums: \(nums)")
print("peek: \(nums.peek()!)")
print("dequeue: \(nums.dequeue()!)")
print("nums: \(nums)")

print("loop")
for num in nums {
    print(num)
}
