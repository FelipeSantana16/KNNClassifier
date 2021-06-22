//
//  KNNClassifier.swift
//  Machine Learning
//
//  Created by Felipe Santana on 17/06/21.
//

import Foundation

class KNNClassifier {
    
    let data: [[Double]]
    let labels: [Int]
    let nNeighbors: Int
    
    init(data: [[Double]], labels: [Int], nNeighbors: Int) {
        self.data = data
        self.labels = labels
        self.nNeighbors = nNeighbors
        
        guard nNeighbors <= data.count else {
            fatalError("Expected 'nNeighbors' (\(nNeighbors)) <= 'data.count' (\(data.count))")
        }
        
        guard data.count == labels.count else {
            fatalError("Expected 'data.count' (\(data.count)) <= 'labels.count' (\(labels.count))")
        }
    }
    
    func fit(x_data: [Double], y_data: [Double]) {
        
    }
    
    
    func predict(new_x: Double) {
        
    }
    
}
