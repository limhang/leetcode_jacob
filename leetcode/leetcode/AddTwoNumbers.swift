//
//  AddTwoNumbers.swift
//  leetcode
//
//  Created by hang lee on 2019/7/16.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 两个数相加
 示例：
 输入：
 (2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：
 7 -> 0 -> 8
 */

/*
 example:
 
 let nodeList = AddTwoNumbers()
 let l1 = NodeList(1)
 l1.next = NodeList(2)
 l1.next!.next = NodeList(3)
 let l2 = NodeList(5)
 l2.next = NodeList(6)
 l2.next!.next = NodeList(7)
 nodeList.logNode(nodeList.add(l1,l2))
 
 output:
 【6, 8, 0, 1】
 
 */

public class NodeList {
    var val: Int
    var next: NodeList?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class AddTwoNumbers: NSObject {
    func add(_ l1: NodeList?, _ l2: NodeList?) -> NodeList? {
        var node1 = l1
        var node2 = l2
        var headNode: NodeList?
        var nextNode: NodeList?
        var carry: Int = 0
        while node1 != nil || node2 != nil {
            let node1val = node1?.val ?? 0
            let node2val = node2?.val ?? 0
            node1 = node1?.next
            node2 = node2?.next
            var sum = node1val + node2val + carry
            carry = sum < 10 ? 0 : 1
            sum = sum % 10
            if nextNode == nil {
                nextNode = NodeList.init(sum)
                headNode = nextNode
            } else {
                nextNode?.next = NodeList.init(sum)
                nextNode = nextNode?.next
            }
        }
        if carry != 0 {
            nextNode?.next = NodeList.init(carry)
        }
        return headNode
    }
}

extension AddTwoNumbers {
    func logNode(_ list:NodeList?) {
        var list = list
        var text = "["
        while (list != nil) {
            text += "\(list!.val)"
            list = list!.next
            if list != nil {text += ", "}
        }
        text += "]"
        print(text)
    }
}
