//
//  CyclicPermutation.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/25.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

//2
//8
//3 2 7 8 1 4 5 6
//10
//2 1 3 4 5 6 7 9 10 8
func countCyclicPermutation() {
    let cases = Int(readLine()!)!
    for _ in 0..<cases {
        let n = Int(readLine()!)!
        var union = UF(n)
        let edges = readLine()!.split(separator: " ")
        for i in 0..<n {
            union.union(i, Int(edges[i])!-1)
        }
        print(union.count)
    }
}

func findRepeatingSequence() {
    let input = readLine()!.split(separator: " ")
    var d = String(input[0])
    let p = Double(input[1])!
    
    var map = [String:Int]()
    var indexArr = [String]()
    var startRepeating = ""
    
    while true {
        let digits = Array(d)
        var value = 0
        for digit in digits {
            value += Int(pow(Double(String(digit))!, p))
        }
        if map[d] != nil{
            startRepeating = d
            break
        }
        map[d] = value
        indexArr.append(d)
        d = String(value)
    }

    var count = 0
    for index in indexArr {
        if index == startRepeating {
            break
        }
        count += 1
    }
    
    print(count)

}
