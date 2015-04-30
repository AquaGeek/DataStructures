//
//  Node.swift
//  DataStructures
//
//  Created by Tyler Stromberg on 4/26/15.
//  Copyright (c) 2015 Tyler Stromberg. All rights reserved.
//

import Foundation

public class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}
