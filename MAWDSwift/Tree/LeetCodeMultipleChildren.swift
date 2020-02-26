//
//  LeetCodePreOrder.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/19.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

// 589. N-ary Tree Preorder Traversal
func preorder(_ root: MultipleTreeNode<Int>) -> [Int] {
    var result = [Int]()
    if let v = root.val {
        result.append(v)
        
        if root.children == nil {
            return result
        }

        for i in 0..<root.children!.count {
            result += preorder(root.children![i])
        }
    }
    
    return result
}

// 590. N-ary Tree Postorder Traversal
func postorder(_ root: MultipleTreeNode<Int>) -> [Int] {
    var result = [Int]()
    if let v = root.val {
        if root.children == nil {
            result.append(v)
            return result
        }

        for i in 0..<root.children!.count {
            result += postorder(root.children![i])
        }
        
        result.append(v)
    }
    
    return result
}
