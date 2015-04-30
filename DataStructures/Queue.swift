//
//  Queue.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/29/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation

/// FIFO data structure
public class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    public private(set) var count = 0
    
    public init() {
    }
    
    /// Adds a new item into the back of the queue.
    ///
    /// Complexity: O(1)
    public func enqueue(item: T) {
        var newTail = Node<T>(item)
        tail?.next = newTail
        count++
        tail = newTail
        
        // Is this the first item?
        if head == nil {
            head = tail
        }
    }
    
    /// Removes and returns the value at the front of the queue,
    /// or `nil` if the stack is empty.
    ///
    /// Complexity: O(1)
    public func dequeue() -> T? {
        if let sureHead = head {
            head = sureHead.next
            count--
            
            // Is this the last item?
            if head == nil {
                tail = nil
            }
            
            return sureHead.value
        } else {
            return nil
        }
    }
    
    /// Returns `true` if the queue is empty.
    public var isEmpty: Bool {
        return count == 0
    }
}
