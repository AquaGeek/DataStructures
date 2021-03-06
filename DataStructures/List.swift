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
    public var value: T
    public var previous: DoublyLinkedNode?
    public var next: DoublyLinkedNode?
    
    public init(_ value: T) {
        self.value = value
    }
}

/// A doubly-linked list
public final class List<T> {
    private typealias ListNode = DoublyLinkedNode<T>
    
    var head: ListNode?
    var tail: ListNode?
    public private(set) var length: Int = 0
    
    public var firstNode: ListNode? {
        return head
    }
    
    public var lastNode: ListNode? {
        return tail
    }
    
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


/// MARK: - Extensions

extension List : SequenceType {
    public func generate() -> GeneratorOf<T> {
        var currentNode = firstNode
        
        return GeneratorOf<T> {
            if let node = currentNode {
                currentNode = node.next
                return node.value
            } else {
                return .None
            }
        }
    }
}

extension List : ArrayLiteralConvertible {
    public convenience init(arrayLiteral elements: T...) {
        self.init()
        for element in elements {
            let node = DoublyLinkedNode<T>(element)
            self.append(node)
        }
    }
}
