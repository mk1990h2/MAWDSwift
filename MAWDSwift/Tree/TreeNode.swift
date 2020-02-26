//
//  TreeNode.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/21.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

class BinaryTreeNode {
    var val: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class MultipleTreeNode<Int> {
    var val: Int?
    var children: [MultipleTreeNode<Int>]?
    
    init(val: Int? = nil, children: [MultipleTreeNode<Int>]? = nil) {
        self.val = val
        self.children = children
    }
}
