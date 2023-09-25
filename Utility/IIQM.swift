//
//  iiqm.swift
//  IIQM
//
//  Created by Shaun Winters on 9/21/17.
//  Copyright © 2017 Dexcom. All rights reserved.

/**  The interquartile mean (IQM) is a statistical measure of central tendency. It is the mean of the middle 50% of data in a data set, and is resistant to outliers.
     For more details refer:
     1) https://www.statisticshowto.com/interquartile-mean-iqm-midmean/
     2) https://www.youtube.com/watch?v=YptQN4YMYuY
*/

import Foundation

class IIQM {
    
    /**
     Calculates the Interquartile Mean (IQM) incrementally of the data in the file at the specified path.
     - Parameter path: path of the file conttaining data set.
     - Returns: none.
     */
    func calculate(path: String) {
        let lines                 = FileReader.readFile(path: path)
        var sortedData: [Int]     = []
        var currentLine           = 1
        var incrementalIQM        = ""
        
        for line in lines {
            // If invalid data return and display/print message
            guard let value = Int(line), value > 0 && value <= 600 else{
                print("Invalid data \(line) at line \(currentLine)")
                return
            }

            insertValueInSortedArray(value, into: &sortedData)
            
            if (sortedData.count >= 4) {
                 incrementalIQM = String(format:"%.2f", calculateIncrementalIQM(data: sortedData))
                 print("Index => \(sortedData.count), Mean => \(incrementalIQM)")
            }
            currentLine += 1
        }
    }
    
    /**
     Inserts an integer value into a sorted array while maintaining the array's sorting order.
     
     This function utilizes a binary search algorithm to efficiently determine the insertion point
     for the specified value in the sorted array. It then inserts the value at that position,
     ensuring that the array remains sorted.
     
     - Parameters:
       - value: The integer value to be inserted into the sorted array.
       - array: An inout parameter representing the sorted array where the value will be inserted.
                The array will be modified in-place.
     
     - Complexity: The time complexity of this operation is O(log n), where 'n' is the number of elements
                   in the sorted array. The function performs a binary search to find the insertion point,
                   and the insertion itself is an O(n) operation in the worst case when the value needs to be
                   inserted at the beginning of the array.
     */
    func insertValueInSortedArray(_ value: Int, into array: inout [Int]) {
        let index = RPBinarySearch.search(value, in: array)
        array.insert(value, at: index)
    }

    
    /**
     Calculates the Incremental Interquartile Mean (IQM) from the given array of integers.
     
     - Parameter data: An array of integers from which to calculate the IQM from.
     
     - Returns: The calculated Incremental IQM as a `Double` value.
     
     - Note: This function is intended to be used for unit testing and should ideally be marked as private.
             However, it's made accessible for testing purposes to ensure the accuracy of the IIQM calculation.
     */
    func calculateIncrementalIQM(data: [Int]) -> Double {
        let quartileSize: Double        = Double(data.count) / 4.0
        
        // calculating lower and upper quartile index for the dataset
        let lowerQuartileIndex: Int     = Int(quartileSize.rounded(.up)) - 1
        let upperQuartileIndex: Int     = Int((quartileSize * 3).rounded(.down))
       
        // determine the middle 50% range of dataset needed to calculate IQM
        let iqmRange                    = data[lowerQuartileIndex...upperQuartileIndex]
        let middleValueOffset: Double   = quartileSize - ((Double(iqmRange.count) / 2.0) - 1)
        
        var sum                         = 0
        var currentQuartileIndex        = 0
        
        //iterate in the range and add the value in variable sum
        for value in iqmRange {
            if (currentQuartileIndex == 0) {
                currentQuartileIndex += 1
                continue;
            }
            else if (currentQuartileIndex == (iqmRange.count - 1)) {
                break;
            }
            
            sum += value
            currentQuartileIndex += 1
        }
        
        // IIQM = [sum of data in range + middleValueOffset * (first+last element of range)] / (2 * quartileSize)
        let interquartileMean: Double   = (Double(sum) + Double(iqmRange.first! + iqmRange.last!) * middleValueOffset) / (2.0 * quartileSize)
        
        return interquartileMean
    }
}
