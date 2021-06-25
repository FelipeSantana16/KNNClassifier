//
//  Metrics.swift
//  Machine Learning
//
//  Created by Felipe Santana on 25/06/21.
//

import Foundation

class Metrics {
    
    public static func getConfusionMatrice(expected: [Int], result: [Int]) -> [[Int]] {
        let size = Set(expected).count
        
        var matrice: [[Int]] = []
        
        for _ in 0...size - 1 {
            let line = [Int](repeating: 0, count: size)
            matrice.append(line)
        }
        
        for i in 0...expected.count - 1 {
            matrice[expected[i]][result[i]] += 1
        }
        
        return matrice
    }

    
    public static func getTruePositive(matrice: [[Int]], classLabel: Int) -> Int {
        return matrice[classLabel][classLabel]
    }

    
    public static func getFalseNegative(matrice: [[Int]], classLabel: Int) -> Int {
        var sum = 0
        
        for i in 0...matrice.count - 1 {
            if (i != classLabel) {
                sum += matrice[classLabel][i]
            }
        }
        
        return sum
    }

    
    public static func getFalsePositive(matrice: [[Int]], classLabel: Int) -> Int {
        var sum = 0
        
        for i in 0...matrice.count - 1 {
            if(i != classLabel) {
                sum += matrice[i][classLabel]
            }
        }
        
        return sum
    }

    
    public static func getTrueNegative(matrice: [[Int]], classLabel: Int) -> Int {
        var sum = 0
        
        for i in 0...matrice.count - 1 {
            for j in 0...matrice.count - 1 {
                if (i != classLabel && j != classLabel) {
                    sum += matrice[i][j]
                }
            }
        }
        
        return sum
    }


    
    public static func getAccuracy(truePositive tp: Int, trueNegative tn: Int, falsePositive fp: Int, falseNegative fn: Int) -> Double {
        
        return (Double(tp) + Double(tn) / (Double(tp) + Double(fp) + Double(tn) + Double(fn)))
    }

    
    public static func getPrecision(truePositive tp: Int, falsePositive fp: Int) -> Double{
        
        return Double(tp) / (Double(tp) + Double(fp))
    }

    
    public static func getRecall(truePositive tp: Int, falseNegative fn: Int) -> Double {
        
        return Double(tp) / (Double(tp) + Double(fn))
    }

    
    public static func getSpecificity(trueNegative tn: Int, falsePositive fp: Int) -> Double {
        
        return Double(tn) / (Double(tn) + Double(fp))
    }
    

    public static func getF1Score(truePositive tp: Int, falsePositive fp: Int, falseNegative fn: Int) -> Double {
        
        let precision = getPrecision(truePositive: tp, falsePositive: fp)
        let recall = getRecall(truePositive: tp, falseNegative: fn)
        
        return (2 * precision * recall) / (precision + recall)
    }
}
