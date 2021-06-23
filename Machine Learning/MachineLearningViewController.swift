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
        
        accuracy /= Double(testsResults.count)
        
        print(accuracy)
        
        print(testLabels)
        print(testsResults)
    }

}
