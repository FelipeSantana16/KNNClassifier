//
//  MachineLearningViewController.swift
//  Machine Learning
//
//  Created by Felipe Santana on 21/06/21.
//

import UIKit

class MachineLearningViewController: UIViewController {
    
    //let KNN = KNNClassifier(neightbors: 3)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (testData, trainData, testLabels, trainLabels) = IrisDataSet.irisTestTrainSplit(testSize: 0.3)
        
        var testsResults: [Int] = []
        var accuracy = 0.0

        
        // train
        let knn = KNNClassifier(data: trainData, labels: trainLabels, nNeighbors: 5)
     
        // test
        for data in testData {
            testsResults.append(knn.predict(newPoint: data))
        }
        
        //View results
        for i in 0...testsResults.count - 1 {
            if (testLabels[i] == testsResults[i]) {
                accuracy += 1
            }
        }
        
        let matrice = confusionMatrice(expected: testLabels, result: testsResults)
        accuracy /= Double(testsResults.count)
        
        print("Acurácia: \n\(accuracy)")
        
        print("\nResultado esperado: ")
        print(testLabels)
        
        print("\nResultado obtido: ")
        print(testsResults)
        
        print("\nMatriz de confusão: ")
        
        //Printar matriz de confusão
        for line in matrice {
            print(line)
        }
        
        let truePositive = getTruePositive(matrice: matrice, classLabel: 2)
        let trueNegative = getTrueNegative(matrice: matrice, classLabel: 2)
        let falsePositive = getFalsePositive(matrice: matrice, classLabel: 2)
        let falseNegative = getFalseNegative(matrice: matrice, classLabel: 2)
        
        print("\n")
        print("True Positive: \n\(truePositive)")
        print("True Negative: \n\(trueNegative)")
        print("False Positive: \n\(falsePositive)")
        print("False Positive: \n\(falseNegative)")
    }
    
    func confusionMatrice(expected: [Int], result: [Int]) -> [[Int]] {
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
    
    func getTruePositive(matrice: [[Int]], classLabel: Int) -> Int {
        return matrice[classLabel][classLabel]
    }
    
    func getFalseNegative(matrice: [[Int]], classLabel: Int) -> Int {
        var sum = 0
        
        for i in 0...matrice.count - 1 {
            if (i != classLabel) {
                sum += matrice[classLabel][i]
            }
        }
        
        return sum
    }
    
    func getFalsePositive(matrice: [[Int]], classLabel: Int) -> Int {
        var sum = 0
        
        for i in 0...matrice.count - 1 {
            if(i != classLabel) {
                sum += matrice[i][classLabel]
            }
        }
        
        return sum
    }
    
    func getTrueNegative(matrice: [[Int]], classLabel: Int) -> Int {
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

}
