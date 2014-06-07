//
//  TJLSetTests.swift
//  TJLSetTests
//
//  Created by Terry Lewis II on 6/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

import XCTest
import Set
class TJLSetTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let set = Set(array:[1,2,3,4,4,4,5,5,5])
        XCTAssert(set.count == 5, "Should be 5 items")
        
        let newSet = Set(items: 1,2,3,4,4,4,5,5,5)
        XCTAssert(set.count == 5, "Should be 5 items")
    }
    
    func testEquality() {
        var set1 = Set(array:[1,2,3,4,4,4,5,5,5])
        var set2 = Set(array:[1,2,3,4,4,4,5,5,5])
        XCTAssert(set1 == set2, "Should be equal")
        
        var set3 = Set(array:[1,2,5,5,5])
        XCTAssert(set1 != set3, "Not equal")
    }
    
    func testIterator() {
        let set = Set(array:[1,2,3,4,4,4,5,5,5])
        var iterations = 0
        for x in set {
            iterations++
        }
        XCTAssert(iterations == set.count, "should be equal")
    }
    
    func testAny() {
        let set = Set(array:[1,2,3,4,4,4,5,5,5])
        for i in 0...3000 {
            var any = set.any()
            XCTAssert(any >= 1 && any <= 5, "should always be in range")
        }
    }
    
    func testAppend() {
        let set = Set(array: [1,2,3,4,5,5,4,4,5,5])
        let otherSet = Set(items: 6,7,8,9,10,10,1000,5600)
        
        let newSet = set.append(otherSet)
        XCTAssert(newSet == Set(items: 1000, 5600, 6,7,8,9,10,1,2,3,4,5), "Should be equal")

    }
}
