//
//  ProblemSetDP.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/03/12.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

func nonDecreasingDigit() {
    let digits = Int(readLine()!)!
    
    var arr = [Int](repeatElement(0, count: digits + 1))
    
    for i in 1...digits {
        if i == 1 {
            // 1: 0~9
            arr[i] = 10
        } else if i == 2 {
            arr[i] = (10 + 1) * 10 / 2
        } else {
            arr[i] = (arr[i-1] - arr[i-2] - 1) * 10 / 2
        }
        print(arr[i])
    }
    
//    print(arr[digits])
}

/**
 https://leetcode.com/problems/longest-increasing-subsequence/
 */
// [10,9,2,5,3,7,101,18] -> [2,3,7,101] -> 4
func lengthOfLIS(_ nums: [Int]) -> Int {
    var lis = [Int](repeating: 1, count: nums.count)
    if nums.isEmpty {
        return 0
    }
    
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                if lis[j] >= lis[i] {
                    lis[i] = lis[j] + 1
                }
            }
        }
    }
    
    return lis.max()!
}

/**
 https://leetcode.com/problems/sum-of-square-numbers/
 */
func judgeSquareSum(_ c: Int) -> Bool {
    let root = Int(ceil(Double(c).squareRoot()))
    var sqr = [Int](repeating: 0, count: root - 1)
    for i in 0..<root {
        
    }
    return true
}

