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
        
        let confusionMatrice = Metrics.getConfusionMatrice(expected: testLabels, result: testsResults)
        accuracy /= Double(testsResults.count)
        
        print("Acurácia Média: \n\(accuracy)")
        print("\nResultado esperado: ")
        print(testLabels)
        print("\nResultado obtido: ")
        print(testsResults)
        print("\nMatriz de confusão: ")
        
        //Printar matriz de confusão
        for line in confusionMatrice {
            print(line)
        }
        
        
        print("\n\nSETOSA: \n")
        let truePositive0 = Metrics.getTruePositive(matrice: confusionMatrice, classLabel: 0)
        let trueNegative0 = Metrics.getTrueNegative(matrice: confusionMatrice, classLabel: 0)
        let falsePositive0 = Metrics.getFalsePositive(matrice: confusionMatrice, classLabel: 0)
        let falseNegative0 = Metrics.getFalseNegative(matrice: confusionMatrice, classLabel: 0)
        
        // accuracy
        let accuracy0 = Metrics.getAccuracy(truePositive: truePositive0, trueNegative: trueNegative0, falsePositive: falsePositive0, falseNegative: falseNegative0)
        // precision
        let precision0 = Metrics.getPrecision(truePositive: truePositive0, falsePositive: falsePositive0)
        // recall
        let recall0 = Metrics.getRecall(truePositive: truePositive0, falseNegative: falseNegative0)
        // specificity
        let specificity0 = Metrics.getSpecificity(trueNegative: trueNegative0, falsePositive: falseNegative0)
        // F1 score
        let f1Score0 = Metrics.getF1Score(truePositive: truePositive0, falsePositive: falsePositive0, falseNegative: falseNegative0)
        
        print("Accuracy: \n\(accuracy0)")
        print("Precision: \n\(precision0)")
        print("Recall: \n\(recall0)")
        print("Specificity: \n\(specificity0)")
        print("F1 Score: \n\(f1Score0)")
        
        
        
        print("\n\nVERSICOLOR: \n")
        let truePositive1 = Metrics.getTruePositive(matrice: confusionMatrice, classLabel: 1)
        let trueNegative1 = Metrics.getTrueNegative(matrice: confusionMatrice, classLabel: 1)
        let falsePositive1 = Metrics.getFalsePositive(matrice: confusionMatrice, classLabel: 1)
        let falseNegative1 = Metrics.getFalseNegative(matrice: confusionMatrice, classLabel: 1)
        
        let accuracy1 = Metrics.getAccuracy(truePositive: truePositive1, trueNegative: trueNegative1, falsePositive: falsePositive1, falseNegative: falseNegative1)
        // precision
        let precision1 = Metrics.getPrecision(truePositive: truePositive1, falsePositive: falsePositive1)
        // recall
        let recall1 = Metrics.getRecall(truePositive: truePositive1, falseNegative: falseNegative1)
        // specificity
        let specificity1 = Metrics.getSpecificity(trueNegative: trueNegative1, falsePositive: falseNegative1)
        // F1 score
        let f1Score1 = Metrics.getF1Score(truePositive: truePositive1, falsePositive: falsePositive1, falseNegative: falseNegative1)
        
        print("Accuracy: \n\(accuracy1)")
        print("Precision: \n\(precision1)")
        print("Recall: \n\(recall1)")
        print("Specificity: \n\(specificity1)")
        print("F1 Score: \n\(f1Score1)")
        
        
        
        print("\n\nVIRGINICA: \n")
        let truePositive2 = Metrics.getTruePositive(matrice: confusionMatrice, classLabel: 2)
        let trueNegative2 = Metrics.getTrueNegative(matrice: confusionMatrice, classLabel: 2)
        let falsePositive2 = Metrics.getFalsePositive(matrice: confusionMatrice, classLabel: 2)
        let falseNegative2 = Metrics.getFalseNegative(matrice: confusionMatrice, classLabel: 2)
        
        let accuracy2 = Metrics.getAccuracy(truePositive: truePositive2, trueNegative: trueNegative2, falsePositive: falsePositive2, falseNegative: falseNegative2)
        // precision
        let precision2 = Metrics.getPrecision(truePositive: truePositive2, falsePositive: falsePositive2)
        // recall
        let recall2 = Metrics.getRecall(truePositive: truePositive2, falseNegative: falseNegative2)
        // specificity
        let specificity2 = Metrics.getSpecificity(trueNegative: trueNegative2, falsePositive: falseNegative2)
        // F1 score
        let f1Score2 = Metrics.getF1Score(truePositive: truePositive2, falsePositive: falsePositive2, falseNegative: falseNegative2)
        
        print("Accuracy: \n\(accuracy2)")
        print("Precision: \n\(precision2)")
        print("Recall: \n\(recall2)")
        print("Specificity: \n\(specificity2)")
        print("F1 Score: \n\(f1Score2)")
    }
}
