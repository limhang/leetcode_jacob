//
//  MergeTwoSortedLists.swift
//  leetcode
//
//  Created by hang lee on 2019/7/18.
//  Copyright © 2019 lazyaudio. All rights reserved.
//

import UIKit

/*
 两个有序链表合并，返回一个有序链表
 
 递归表达式
 f(x) = f(l1,l2) = {
    l2                      ,l1 == nil
    l1                      ,l2 == nil
    l1(0) + f(l1(1),l2)     ,l1(0).val >= l2(0).val
    l2(0) + f(l1,l2(1))     ,else
 }
 其中，l1(1)，就是l1链表的下一个节点
 
 
 example:
 let nodeList = MergeTwoSortedLists()
 let l1 = ListNode(1)
 l1.next = ListNode(2)
 l1.next!.next = ListNode(8)
 let l2 = ListNode(5)
 l2.next = ListNode(6)
 l2.next!.next = ListNode(7)
 let resList = nodeList.mergeTwoLists(l1, l2)
 AddTwoNumbers().logNode(resList)
 
 output:
 【1, 2, 5, 6, 7, 8】
 */

class MergeTwoSortedLists: NSObject {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        var resList: ListNode?
        if (l1.val >= l2.val) {
            resList = ListNode(l2.val)
            resList?.next = mergeTwoLists(l2.next, l1)
        } else {
            resList = ListNode(l1.val)
            resList?.next = mergeTwoLists(l1.next, l2)
        }
        return resList
    }
}
