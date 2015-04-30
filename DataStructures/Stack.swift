//
//  Stack.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/26/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation

public class Stack<T> {
    private var storage: Node<T>?
    public private(set) var count = 0
    
    public init() {
    }
    
    /// Pushes a new item onto the stack.
    /// 
    /// Complexity: O(1)
    public func push(item: T) {
        var newTop = Node<T>(item)
        newTop.next = storage
        count++
        storage = newTop
    }
    
    /// Removes and returns the value at the top of the stack,
    /// or `nil` if the stack is empty.
    ///
    /// Complexity: O(1)
    public func pop() -> T? {
        if let sureStorage = storage {
            storage = sureStorage.next
            count--
            return sureStorage.value
        } else {
            return nil
        }
    }
    
    /// Returns `true` if the stack is empty.
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// Returns the value at the top of the stack without removing it,
    /// or `nil` if the stack is empty.
    ///
    /// Complexity: O(1)
    public func peek() -> T? {
        return storage?.value
    }
}
