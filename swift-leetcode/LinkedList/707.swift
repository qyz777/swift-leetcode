//
//  707.swift
//  swift-leetcode
//
//  Created by Q YiZhong on 2019/6/29.
//  Copyright © 2019 YiZhong Qi. All rights reserved.
//

import Foundation

class MyLinkedList {
    
    class Node {
        var val: Int
        var next: Node?
        init(_ val: Int) {
            self.val = val
        }
    }
    
    var node: Node?
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var p = node
        var i = 0
        while p != nil {
            if i == index {
                return p!.val
            }
            i += 1
            p = p?.next
        }
        return -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newHead = Node.init(val)
        newHead.next = node
        node = newHead
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let newTail = Node.init(val)
        var p = node
        while p?.next != nil {
            p = p?.next
        }
        p?.next = newTail
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= 0 {
            addAtHead(val)
            return
        }
        let newNode = Node.init(val)
        var p = node
        var i = 0
        while p != nil {
            if i == index - 1 {
                let tmp = p?.next
                p?.next = newNode
                newNode.next = tmp
                break
            }
            p = p?.next
            i += 1
        }
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index == 0 {
            node = node?.next
            return
        }
        var p = node
        var i = 0
        while p != nil {
            if i == index - 1 {
                p?.next = p?.next?.next
                break
            }
            p = p?.next
            i += 1
        }
    }
}
