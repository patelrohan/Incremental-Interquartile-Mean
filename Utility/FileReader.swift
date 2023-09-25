//
//  FileReader.swift
//  IIQM
//
//  Created by Rohan on 9/24/23.
//  Copyright © 2023 Dexcom. All rights reserved.
//

import Foundation

struct FileReader{
    
    static func readFile(path: String) -> Array<String> {
        do {
            let contents:NSString = try NSString(contentsOfFile: path,
                                                 encoding: String.Encoding.ascii.rawValue)
            let trimmed:String = contents.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
            let lines:Array<String> =  NSString(string: trimmed).components(separatedBy: NSCharacterSet.newlines)
            
            return lines
        } catch {
            print("Unable to read file: \(path)")
            return [String]()
        }
    }
}
