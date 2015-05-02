//
//  ListTests.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 5/1/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation
import XCTest

import DataStructures

class ListTests: XCTestCase {

    func testIsEmpty() {
        let list = List<Int>()
        XCTAssertTrue(list.isEmpty, "List should be empty")
        
        let node = DoublyLinkedNode<Int>(1)
        list.append(node)
        XCTAssertFalse(list.isEmpty, "List should not be empty")
    }
    
    func testPrepend() {
        let list = List<Int>(arrayLiteral: 1)
        XCTAssertEqual(list.length, 1, "List should contain 1 item")
        
        let otherNode = DoublyLinkedNode<Int>(2)
        list.prepend(otherNode)
        XCTAssertTrue(list.firstNode! === otherNode, "2 should have been inserted at the front of the list")
    }
    
    func testAppend() {
        let list = List<Int>()
        let firstNode = DoublyLinkedNode<Int>(1)
        list.prepend(firstNode)
        XCTAssertEqual(list.length, 1, "List should contain 1 item")
        
        let otherNode = DoublyLinkedNode<Int>(2)
        list.append(otherNode)
        XCTAssertTrue(list.firstNode! === firstNode, "2 should have been inserted at the front of the list")
    }
    
    func testRemove() {
        let list = List<Int>()
        
        var nodeToRemove: DoublyLinkedNode<Int>? = nil
        
        for i in 0..<10 {
            let node = DoublyLinkedNode<Int>(i)
            list.append(node)
            
            if i == 5 {
                nodeToRemove = node
            }
        }
        
        XCTAssertEqual(list.length, 10, "List should contain 10 items")
        
        list.remove(nodeToRemove!)
        XCTAssertEqual(list.length, 9, "List should contain 9 items")
        
        // Ensure that we removed the correct one
        var node = list.firstNode
        var i = 0
        while node != nil {
            XCTAssertEqual(node!.value, i)
            node = node?.next
            
            if ++i == 5 {
                i++
            }
        }
    }
    
    func testTraversal() {
        let list = List<Int>(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
        
        XCTAssertEqual(list.length, 10, "List should have 10 items in it")
        
        var i = 0
        for j in list {
            XCTAssertEqual(j, i++)
        }
    }
    
    func testMoveToFront() {
        let values = [0, 1, 2, 3]
        let list = List<Int>()
        
        var nodeToMove: DoublyLinkedNode<Int>? = nil
        
        for i in values {
            let node = DoublyLinkedNode<Int>(i)
            list.append(node)
            
            if i == 1 {
                nodeToMove = node
            }
        }
        
        XCTAssertEqual(list.length, values.count)
        var node = list.firstNode
        
        for i in values {
            XCTAssertEqual(node!.value, i, "List is not in the correct order")
            node = node?.next
        }
        
        list.moveToFront(nodeToMove!)
        XCTAssertTrue(list.firstNode === nodeToMove!, "Node not moved to front")
    }
    
    func testMoveToBack() {
        let values = [0, 1, 2, 3]
        let list = List<Int>()
        
        var nodeToMove: DoublyLinkedNode<Int>? = nil
        
        for i in values {
            let node = DoublyLinkedNode<Int>(i)
            list.append(node)
            
            if i == 2 {
                nodeToMove = node
            }
        }
        
        XCTAssertEqual(list.length, values.count)
        var node = list.firstNode
        
        for i in values {
            XCTAssertEqual(node!.value, i, "List is not in the correct order")
            node = node?.next
        }
        
        list.moveToBack(nodeToMove!)
        XCTAssertTrue(list.lastNode === nodeToMove!, "Node not moved to front")
    }
}
