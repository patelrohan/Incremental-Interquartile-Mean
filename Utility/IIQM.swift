//
//  iiqm.swift
//  IIQM
//
//  Created by Shaun Winters on 9/21/17.
//  Copyright © 2017 Dexcom. All rights reserved.
//

import Foundation

class IIQM {
    func calculate(path: String) {
        let lines = FileReader.readFile(path: path)
        var data: [Int] = []
        for line in lines {
            let value: Int = Int(line)!
            data.append(value)
            data.sort()
            
            if (data.count >= 4) {
                let q: Double = Double(data.count) / 4.0
                let i: Int = Int(q.rounded(.up)) - 1
                let c: Int = Int((q*3).rounded(.down)) - i + 1
                let ys = data[i...(i+c-1)]
                let factor: Double = q - ((Double(ys.count) / 2.0) - 1)
                var sum = 0
                
                var j = 0
                for listEnumerator in ys {
                    if (j == 0) {
                        j += 1
                        continue;
                    }
                    else if (j == (ys.count - 1)) {
                        break;
                    }
                    
                    sum += listEnumerator
                    j += 1
                }
                
                let mean: Double = (Double(sum) + Double(ys.first! + ys.last!) * factor) / (2.0 * q)
                let meanString = String(format:"%.2f", mean)
                print("Index => \(data.count), Mean => \(meanString)")
            }
        }
    }
}
