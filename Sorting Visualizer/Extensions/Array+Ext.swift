//
//  Array+Ext.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import Foundation

extension Array where Element == Int {
    
    static func generateRandomArray(length: Int) -> [Int] {
        var array = [Int]()
        for _ in 0..<length {
            array.append(Int.random(in: 5...100))
        }
            
        return array
    }
    
}
