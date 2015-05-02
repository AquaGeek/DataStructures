//
//  LRUCache.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/29/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation

private class LRUCacheNode<Key: Hashable, Value> {
    let key: Key
    var value: Value
    var previous: LRUCacheNode?
    var next: LRUCacheNode?
    
    init(key: Key, value: Value) {
        self.key = key
        self.value = value
    }
}

public class LRUCache<Key: Hashable, Value> {
    private typealias Node = LRUCacheNode<Key, Value>
    
    private var capacity: Int
    
    private var storage: [Key: Node]
    private var head: Node?
    private var tail: Node?
    
    public init(capacity: Int) {
        self.capacity = capacity
        self.storage = [Key: Node](minimumCapacity: capacity)
    }
    
    public var count: Int {
        get {
            return storage.count
        }
    }
    
    public subscript(key: Key) -> Value? {
        /// Complexity: O(1)
        get {
            if let node = storage[key] {
                moveNodeToFront(node)
                return node.value
            }
            
            return nil
        }
        /// Complexity: O(1)
        set(newValue) {
            if let value = newValue {
                // Value was provided. Find the corresponding node, update its value, and move
                // it to the front of the list. If it's not found, create it at the front.
                if let node = storage[key] {
                    node.value = value
                    moveNodeToFront(node)
                } else {
                    var newNode = Node(key: key, value: value)
                    addNodeToFront(newNode)
                    
                    storage[key] = newNode
                    
                    // Truncate from the tail if we're over capacity
                    if count > capacity {
                        for _ in capacity..<count {
                            storage[tail!.key] = nil
                            tail = tail?.previous
                            tail?.next = nil
                        }
                    }
                }
            } else {
                // Value was removed. Find the corresponding node and remove it as well.
                if let node = storage[key] {
                    storage[key] = nil
                    removeNode(node)
                }
            }
        }
    }
    
    
    /// MARK: - Internal
    
    /// Prepends the given node to the front of the list
    ///
    /// Complexity: O(1)
    private func addNodeToFront(node: Node) {
        if let headNode = head {
            head = node
            node.next = headNode
            headNode.previous = node
        } else {
            head = node
            tail = node
        }
    }
    
    /// Moves the given node to the front of the list
    ///
    /// Complexity: O(1)
    private func moveNodeToFront(node: Node) {
        // Link the preceding node to the next
        removeNode(node)
        
        // Prepend this node to the front of the list
        node.next = head
        head = node
    }
    
    /// Removes the given node by linking its predecessor to its successor
    ///
    /// Complexity: O(1)
    private func removeNode(node: Node) {
        let previous = node.previous
        let next = node.next
        
        previous?.next = next
        next?.previous = previous
        
        // Update the tail, if necessary
        if tail?.key == node.key {
            tail = previous
        }
    }
}
