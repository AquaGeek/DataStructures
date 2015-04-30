//
//  StackTests.swift
//  DataStructuresTests
//
//  Created by Tyler Stromberg on 4/26/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation
import XCTest

import DataStructures

class StackTests: XCTestCase {
    
    func testIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty, "Stack should be empty when initialized")
    }
    
    func testPush() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0, "Stack should be empty")
        
        stack.push(1)
        XCTAssertEqual(stack.count, 1, "Stack should have 1 item")
    }
    
    func testPop() {
        var stack = Stack<Int>()
        stack.push(1)
        XCTAssertEqual(stack.count, 1, "Stack should have 1 item")
        
        var top = stack.pop()
        XCTAssertEqual(top!, 1, "Wrong value returned")
        XCTAssertEqual(stack.count, 0, "Stack should now be empty")
    }
    
    func testPopWhenEmpty() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0, "Stack should be empty")
        XCTAssertNil(stack.pop())
    }
    
    func testLIFO() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "Stack should have 3 items")
        
        XCTAssertEqual(stack.pop()!, 3, "Wrong value returned")
        XCTAssertEqual(stack.pop()!, 2, "Wrong value returned")
        XCTAssertEqual(stack.pop()!, 1, "Wrong value returned")
    }
}
