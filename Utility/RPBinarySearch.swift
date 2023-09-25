//
//  RPBinarySearch.swift
//  IIQM
//
//  Created by Rohan on 9/25/23.
//  Copyright © 2023 Dexcom. All rights reserved.
//

import Foundation

struct RPBinarySearch{
    /** Search for the position to insert a value.
      
      - Parameters:
        - value: The integer value to search for or insert.
        - array: A sorted array of integers.
      - Returns: The index where the value should be inserted to maintain sorting or the index of the existing value if found. */

    static func search(_ value: Int, in array: [Int]) -> Int {
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            
            // Value already exists, insert at this position.
            if array[mid] == value {
                return mid
            }
            else if array[mid] < value {
                left = mid + 1
            }
            else {
                right = mid - 1
            }
        }
        // Value should be inserted at this position to maintain sorting.
        return left
    }
}
