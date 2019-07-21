//
//  ValidSearchTree.swift
//  leetcode
//
//  Created by xiaoyuyu on 2019/7/21.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 判断给定的树，是不是一个二叉搜索树
 【二叉搜索树：如果其左子树数组小于根节点，右子树数组大于根节点，且所有子树都满足上述，则为搜索树】
 
 使用递归的方式，判断
 f(tree) {
    1.tree == nil       , true
    2.(!tree.leftTree || tree.leftTree.val < tree.val) && (!tree.rightTree || tree.RightTree.val > tree.val) && f(tree.leftTree) && f(tree.rightTree)
 }
 */

class ValidSearchTree: NSObject {
    func valid(_ tree: TreeNode?) -> Bool {
        var resBool: Bool = true
        // 1.如果没有数组，则直接返回ture
        guard let tree = tree else {
            return true
        }
        
        // 2.递归判断
        if let leftTree = tree.leftTree {
            resBool = leftTree.val < tree.val
        }
        
        if let rightTree = tree.rightTree {
            resBool = rightTree.val > tree.val
        }
        return valid(tree.leftTree) && valid(tree.rightTree) && resBool
    }
}
