//
//  LRUCacheTests.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/29/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation
import XCTest

import DataStructures

class LRUCacheTests: XCTestCase {
    func testOldestItemEvicted() {
        let cache = LRUCache<Int, String>(capacity: 2)
        
        cache[1] = "Hello"
        cache[2] = "World"
        cache[3] = "!"
        
        XCTAssertNil(cache[1], "Item should have been evicted")
    }
    
    func testRetrievalMakesItemNewest() {
        let cache = LRUCache<Int, String>(capacity: 3)
        
        cache[1] = "Hello"
        cache[2] = "World"
        cache[3] = "!"
        
        XCTAssertNotNil(cache[1], "Item should still be in cache")
        
        cache[4] = "olleH"
        
        XCTAssertNotNil(cache[1], "Item should still be in cache")
        XCTAssertNil(cache[2], "Item should have been evicted")
    }
    
    func testCacheWritePerformance() {
        let cache = LRUCache<Int, String>(capacity: 1000)
        
        self.measureBlock {
            for i in 0..<5000 {
                cache[i] = String(i)
            }
        }
    }
    
    func testCacheReadPerformance() {
        let capacity = 10000
        let cache = LRUCache<Int, String>(capacity: capacity)
        
        for i in 0..<capacity {
            cache[i] = String(i)
        }
        
        var value: String?
        self.measureBlock {
            let i = Int(arc4random_uniform(UInt32(capacity)))
            value = cache[i]
        }
    }
}
