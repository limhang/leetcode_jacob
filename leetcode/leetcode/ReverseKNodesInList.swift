//
//  ReverseKNodesInList.swift
//  leetcode
//
//  Created by xiaoyuyu on 2019/7/20.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 k个一组，翻转链表
 
 采用栈的方式进行数组翻转
 
 example:
 
 let nodeList = AddTwoNumbers()
 let l1 = ListNode(1)
 l1.next = ListNode(2)
 l1.next?.next = ListNode(3)
 l1.next?.next?.next = ListNode(4)
 l1.next?.next?.next?.next = ListNode(5)
 nodeList.logNode(ReverseKNodesInList().reverse(l1, 3))
 
 output:
 
 [3, 2, 1, 4, 5]
 */

class ReverseKNodesInList: NSObject {
    func reverse(_ list: ListNode?, _ k: Int) -> ListNode? {
        var k = k
        let bufferK = k
        
        var list = list
        let bufferList = list
        
        var stack = [ListNode]()
        
        // 1.将链表中的k个Node加入数组中，且加上异常情况处理
        while k > 0 {
            k -= 1
            if (list == nil) {
                return bufferList
            } else {
                stack.append(list!)
            }
            list = list?.next
        }
        
        // 2.将数组中的元素进行重排序
        while k < bufferK - 1 {
            stack[bufferK - k - 1].next = stack[bufferK - k - 2]
            k += 1
        }
        
        stack[0].next = reverse(list, bufferK)
        return stack[bufferK - 1]
    }
}
