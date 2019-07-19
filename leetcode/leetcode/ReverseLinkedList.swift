
//
//  ReverseLinkedList.swift
//  leetcode
//
//  Created by xiaoyuyu on 2019/7/18.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 反转链表，采用头插法
 
 example:
 
 let nodeList = AddTwoNumbers()
 let l1 = ListNode(1)
 l1.next = ListNode(2)
 l1.next?.next = ListNode(5)
 l1.next?.next?.next = ListNode(3)
 nodeList.logNode(ReverseLinkedList().reverse(l1))
 
 output:
 【, 5, 2, 1】
 */


class ReverseLinkedList: NSObject {
    func reverse(_ list: ListNode?) -> ListNode? {
        var list = list
        var head: ListNode?
        var next: ListNode?
        while list != nil {
            next = list?.next
            list?.next = head
            head = list
            list = next
        }
        return head
    }
}
