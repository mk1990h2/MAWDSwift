//
//  LeetCodeLCA.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/20.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

//Input Specification
//First line: N (The number of nodes, 2 <= N <= 50,000)
//Next N-1 lines: two nodes connected on the tree are given.
//N+1 th line: M (The number of pairs to process LCA, 1 <= M <= 10,000)
//Next M lines: each line represents two nodes to get the LCA
//
//
//Output Specification
//Outputs the Lowest Common Ancestor of the two nodes (M lines)

//Sample Input1
//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15
//
//Sample Output1
//2
//4
//2
//1
//3
//1

func preorderTraversal(_ root: BinaryTreeNode, _ p: BinaryTreeNode, _ q: BinaryTreeNode) -> BinaryTreeNode {
    // search p and q from root
    
    
    return root
}
