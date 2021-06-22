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
    
    func fit() {
        
    }
    
    func predict(newPoint: [Double]) -> Int{
        // calcular distancias
        let distanceAndLabels = distanceFromAllPoints(newPoint: newPoint)
        // pegar os k pontos mais próximos e os seus labels
        let closestNeighbors = closestNeighbors(distancesAndLabels: distanceAndLabels)
        // ver qual o label mais comum entre os k pontos(se todas forem igualmente comuns, pegar o mais próximo)
        let label = mostFrequentNeighborsLabel(closestNeighbors: closestNeighbors)
        
        return label
    }
    
    private func mostFrequentNeighborsLabel (closestNeighbors: [(key: Double, value: Int)]) -> Int{
        
        var labels = [Int : Int]()
        
        for neighbor in closestNeighbors {
            labels[neighbor.value] = (labels[neighbor.value] ?? 0) + 1
        }
        
        for label in labels {
            if label.value == labels.values.max() {
                return label.key
            }
        }
        
        fatalError("Cannot find the most frequent neighbors label")
        
    }
    
    private func closestNeighbors (distancesAndLabels: [Double : Int]) -> [(key: Double, value: Int)]{
        
        let closestNeighbors = Array(distancesAndLabels.sorted(by: { $0.key < $1.key}))[0...self.nNeighbors - 1]
        
        return Array(closestNeighbors)
    }
    
    private func distanceFromAllPoints(newPoint: [Double]) -> [Double : Int] {
        var distancesAndLabels = [Double : Int]()
        
        for (index, actualPoint) in data.enumerated() {
            distancesAndLabels[euclidianDistance(actualPoint: actualPoint, newPoint: newPoint)] = labels[index]
        }
        
        return distancesAndLabels
    }
    
    private func euclidianDistance(actualPoint: [Double], newPoint: [Double]) -> Double {
        var distances: [Double] = []
        
        for dimension in 0...actualPoint.count - 1 {
            distances[dimension] = pow(actualPoint[dimension] - newPoint[dimension], 2)
        }
        
        return distances.reduce(0, +)
        
    }
}
