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
 可以采用递归的方式，递归方程式
 f(l1,l2) = {
    1. l2                                           , l1 == nil
    2. l1                                           , l2 == nil
    3. l(1) + f(f(l1.next, l2.next),l(1))           , (l1.val + l2.val) > 9
    4. l(l1.val + l2.val) + f(l1.next, l2.next)     , else
 }
 
 Demo:
 ```
 class AddTwoNumbers {
 func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
 guard let l1 = l1 else {return l2}
 guard let l2 = l2 else {return l1}
 
 let outputNode = ListNode((l1.val + l2.val)%10)
 if l1.val + l2.val > 9 {
 outputNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next),
 ListNode(1))
 } else {
 outputNode.next = addTwoNumbers(l1.next, l2.next)
 }
 
 return outputNode
 }
 }
 ```
 */


/*
 example:
 
 let nodeList = AddTwoNumbers()
 let l1 = ListNode(1)
 l1.next = ListNode(2)
 l1.next!.next = ListNode(3)
 let l2 = ListNode(5)
 l2.next = ListNode(6)
 l2.next!.next = ListNode(7)
 nodeList.logNode(nodeList.add(l1,l2))
 
 output:
 【6, 8, 0, 1】
 
 */

class AddTwoNumbers: NSObject {
    func add(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var headNode: ListNode?
        var nextNode: ListNode?
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
                nextNode = ListNode.init(sum)
                headNode = nextNode
            } else {
                nextNode?.next = ListNode.init(sum)
                nextNode = nextNode?.next
            }
        }
        if carry != 0 {
            nextNode?.next = ListNode.init(carry)
        }
        return headNode
    }
}

extension AddTwoNumbers {
    func logNode(_ list:ListNode?) {
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
