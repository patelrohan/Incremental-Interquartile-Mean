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
    
    func testSuccessfulIncrementalIQMCalculation(){
        //Given
        let testData = [4, 5, 6, 8, 9, 11, 14, 16, 20]
        let iiqmObject = IIQM()
        
        //When
        let iiqm = iiqmObject.calculateIncrementalIQM(data: testData)
       
        //Then (Assert)
        //XCTAssertEqual(String(format: "%.2f", iiqm), "9.56")
        XCTAssertEqual(iiqm, 9.555, accuracy: 0.001)
    }
    
}
