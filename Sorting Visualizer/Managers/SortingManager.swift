//
//  SortingManager.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 7.3.21..
//

import UIKit


enum Sort { case selection, insertion, bubble }

protocol SortingManagerDelegate: class {
    func select(index: Int, delay: Int, color: UIColor)
    func swap(sort: Sort, firstIndex: Int, secondIndex: Int)
}


class SortingManager {
    
    weak var delegate: SortingManagerDelegate!
    private var delay = 75
    
    func selectionSort(array: [Int], completed: @escaping ([Int]) -> Void) {
        var array = array
        
        DispatchQueue.global(qos: .default).async {
            for i in 0..<array.count {
                var minValue = array[i]
                var minIndex = i
                self.delegate.select(index: i, delay: 0, color: .blue)
                
                for j in i+1..<array.count {
                    self.delegate.select(index: j, delay: self.delay, color: .blue)
                    if array[j] < minValue {
                        minValue = array[j]
                        minIndex = j
                    }
                    usleep(100000)
                }
                
                if minValue < array[i] { array.swapAt(i, minIndex) }
                self.delegate.swap(sort: .selection, firstIndex: i, secondIndex: minIndex)
            }
            completed(array)
        }
    }
    
    func bubbleSort(array: [Int], completed: @escaping ([Int]) -> Void) {
        var array = array
        
        DispatchQueue.global(qos: .default).async {
            for i in 0..<array.count {
                for j in 0..<array.count-i-1 {
                    self.delegate.select(index: j, delay: self.delay, color: .blue)
                    self.delegate.select(index: j+1, delay: self.delay, color: .blue)
                    usleep(100000)
                    if array[j] > array[j+1] {
                        array.swapAt(j, j+1)
                        self.delegate.swap(sort: .bubble, firstIndex: j, secondIndex: j+1)
                    }
                }
            }
            completed(array)
        }
    }
    
    func insertionSort(array: [Int], completed: @escaping ([Int]) -> Void) {
        var array = array
        
        DispatchQueue.global(qos: .default).async {
            for i in 1..<array.count {
                let current = array[i]
                var j = i-1
                
                while j >= 0 && array[j] > current {
                    self.delegate.select(index: j+1, delay: self.delay, color: .blue)
                    self.delegate.select(index: j, delay: self.delay, color: .blue)
                    usleep(100000)
                
                    self.delegate.swap(sort: .insertion, firstIndex: j+1, secondIndex: j)
                    
                    array[j+1] = array[j]
                    j -= 1
                }
                
                array[j+1] = current
            }
            self.delegate.select(index: array.endIndex-1, delay: 0, color: .white)
            completed(array)
        }
    }

    
}



