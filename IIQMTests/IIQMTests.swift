//
//  IIQMTests.swift
//  IIQMTests
//
//  Created by Ryan Arana on 6/15/18.
//  Copyright © 2018 Dexcom. All rights reserved.
//

import XCTest
@testable import IIQM

class IIQMTests: XCTestCase {
    
    let iiqmObject = IIQM()
    
    func testInsertValueInSortedArray() {
        // Given
        var sortedArray = [10, 20, 30, 40, 50]
        let valueToInsert = 25
        
        // When
        iiqmObject.insertValueInSortedArray(valueToInsert, into: &sortedArray)
        
        // Then (Assert)
        // Verify that the value is inserted at the correct position
        XCTAssertEqual(sortedArray, [10, 20, 25, 30, 40, 50])
    }
    
    func testSuccessfulIncrementalIQMCalculation(){
        //Given
        let testData = [4, 5, 6, 8, 9, 11, 14, 16, 20] //sorted array
        let iiqmObject = IIQM()
        
        //When
        let iiqm = iiqmObject.calculateIncrementalIQM(data: testData)
       
        //Then (Assert)
        //XCTAssertEqual(String(format: "%.2f", iiqm), "9.56")
        XCTAssertEqual(iiqm, 9.555, accuracy: 0.001)
    }
    
}
