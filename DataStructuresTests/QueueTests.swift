//
//  QueueTests.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/29/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation
import XCTest

import DataStructures

class QueueTests: XCTestCase {
    
    func testIsEmpty() {
        var queue = Queue<Int>()
        XCTAssertTrue(queue.isEmpty, "Queue should be empty when initialized")
    }
    
    func testEnqueue() {
        var queue = Queue<Int>()
        XCTAssertEqual(queue.count, 0, "Queue should be empty")
        
        queue.enqueue(1)
        XCTAssertEqual(queue.count, 1, "Queue should have 1 item")
    }
    
    func testDequeue() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        XCTAssertEqual(queue.count, 1, "Queue should have 1 item")
        
        var item = queue.dequeue()
        XCTAssertEqual(item!, 1, "Wrong value returned")
        XCTAssertEqual(queue.count, 0, "Queue should now be empty")
    }
    
    func testDequeueWhenEmpty() {
        var queue = Queue<Int>()
        XCTAssertEqual(queue.count, 0, "Queue should be empty")
        XCTAssertNil(queue.dequeue())
    }
    
    func testFIFO() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        XCTAssertEqual(queue.count, 3, "Queue should have 3 items")
        
        XCTAssertEqual(queue.dequeue()!, 1, "Wrong value returned")
        XCTAssertEqual(queue.dequeue()!, 2, "Wrong value returned")
        XCTAssertEqual(queue.dequeue()!, 3, "Wrong value returned")
    }
}
