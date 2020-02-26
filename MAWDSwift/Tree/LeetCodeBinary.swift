//
//  LeetCodeBinaryPreOrder.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/19.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

func preorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    var result = [Int]()
    if root == nil {
        return result
    }
    result.append(root!.val)

    var remained = Stack<BinaryTreeNode>()
    remained.push(item: root!)
    var current = root!.left
    
    while remained != nil {
        result.append(current!.val)
        
        if let left = current!.left {
            current = left
        } else if let right = current!.right {
            current = right
        } else {
            current = remained.pop()!.right
        }
    }

    
    return result
}

