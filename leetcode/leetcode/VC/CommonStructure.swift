//
//  CommonStructure.swift
//  leetcode
//
//  Created by xiaoyuyu on 2019/7/21.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

public class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class TreeNode {
    var val: Int
    var leftTree: TreeNode?
    var rightTree: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
}

public class BasicTreeOp: NSObject {
    /*
     二叉树创建函数，输入数组【5,1,4,-1,-1,3,6】其中-1代表节点为空，使用递归的思想创建
     f(0...i) = {
        1.直接返回      , i == -1（说明节点为空）
        2.t(i) + t(i).leftTree + t(i).rightTree         ，其中t(i).leftTree == f(i + 1)，t(i).rightTree == f(i + 2)
     }
     */
    
    func createTree(_ array: [Int]) -> TreeNode? {
        var tree: TreeNode?
        
        for i in 0...array.count - 1 {
            if (array[i] != -1) {
                tree = TreeNode(array[i])
                // 2.i+1大于count，异常处理
                if (i+1<array.count) {
                    tree?.leftTree = createTree(Array(array.suffix(from: i+1)))
                }
                // 3.i+2大于count，异常处理
                if (i+2<array.count) {
                    tree?.rightTree = createTree(Array(array.suffix(from: i+2)))
                }
            }
        }
        return tree
    }
}

class CommonStructure: NSObject {
    
}
