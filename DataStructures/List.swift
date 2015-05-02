//
//  List.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/30/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation

/// Element in a linked list
public class DoublyLinkedNode<T> {
    var value: T
    var previous: DoublyLinkedNode?
    var next: DoublyLinkedNode?
    
    public init(value: T) {
        self.value = value
    }
}

/// A doubly-linked list
public class List<T> {
    private typealias ListNode = DoublyLinkedNode<T>
    
    var head: ListNode?
    var tail: ListNode?
    var length: Int = 0
    
    public init() {
    }
    
    /// Returns `true` if the list is empty.
    public var isEmpty: Bool {
        return length == 0
    }
    
    /// Add node to front of list
    ///
    /// Complexity: O(1)
    public func prepend(node: ListNode) {
        node.next = head
        head?.previous = node
        head = node
        
        // Is this the first node?
        if length == 0 {
            tail = node
        }
        
        length++
    }
    
    /// Add node to end of list
    ///
    /// Complexity: O(1)
    public func append(node: ListNode) {
        tail?.next = node
        node.previous = tail
        tail = node
        
        // Is this the first node?
        if length == 0 {
            head = node
        }
        
        length++
    }
    
    /// Remove node from the list
    ///
    /// Complexity: O(1)
    public func remove(node: ListNode) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        length--
    }
    
    /// Move node to the front of the list
    ///
    /// Complexity: O(1)
    public func moveToFront(node: ListNode) {
        remove(node)
        prepend(node)
    }
    
    /// Move node to the end of the list
    ///
    /// Complexity: O(1)
    public func moveToBack(node: ListNode) {
        remove(node)
        append(node)
    }
}
