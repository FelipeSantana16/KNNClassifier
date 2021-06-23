//
//  Iris Data.swift
//  Machine Learning
//
//  Created by Felipe Santana on 18/06/21.
//

import Foundation

class IrisDataSet {
    
    
    enum IrisSpecies: String {
        case setosa, versicolor, virginica
        
        static func fromString(_ s: String) -> Int {
            switch s {
            case IrisSpecies.setosa.rawValue: return 0
            case IrisSpecies.versicolor.rawValue: return 1
            case IrisSpecies.virginica.rawValue: return 2
            default: return 0
            }
        }
        
        static func fromLabel(_ l: Int) -> String {
            switch l {
                case 0: return IrisSpecies.setosa.rawValue
                case 1: return IrisSpecies.versicolor.rawValue
                case 2: return IrisSpecies.virginica.rawValue
                default: return IrisSpecies.setosa.rawValue
            }
        }
    }
    
    static public func irisTestTrainSplit(testSize: Float) -> ([[Double]], [[Double]], [Int], [Int]) {
        let (data, labels) = getIrisDataSet()
        
        let sizeOfTest = Float(data.count) * testSize

        var testIndex: [Int] = []
        var trainIndex: [Int] = []

        var train: [[Double]] = []
        var test: [[Double]] = []
        
        var trainLabels: [Int] = []
        var testLabels: [Int] = []

        while testIndex.count < Int(sizeOfTest) {
            let random = Int.random(in: 0...data.count - 1)

            if (!testIndex.contains(random)) {
                testIndex.append(random)
                test.append(data[random])
                testLabels.append(labels[random])
            }
        }

        for i in 0...data.count - 1 {

            if (!testIndex.contains(i)) {
                trainIndex.append(i)
                train.append(data[i])
                trainLabels.append(labels[i])
            }
        }

        return (test, train, testLabels, trainLabels)
    }
    
    
    static private func getIrisDataSet() -> ([[Double]], [Int]) {
        
        let irisData = transformIrisCSVToArrays(csvName: "Iris")
        
        return irisData
        
    }
    
     static private func transformIrisCSVToArrays(csvName: String) -> ([[Double]], [Int]) {
        
        // Carregamos os dados em formato de string longa
        let csvInString = CSVLoader.loadCSV(from: csvName)
        
        // Dividimos os dados por linha
        var rows = csvInString.components(separatedBy: "\n")
        
        // Removemos a linha com os nomes de cada coluna
        rows.removeFirst()
        
        // Dividimos os dados também em colunas
        var irisData = rows.map { row -> [String] in
            return row.components(separatedBy: ",")
        }
        
        // Removemos a linha vazia que ficava no final do arquivo
        irisData.removeLast()
        
        //Separando os labels
        let labels = irisData.map { row -> Int in
            let label = IrisSpecies.fromString(row[5])
            return label
        }
        
        // Removemos as colunas de id e label
        for i in 0...irisData.count - 1 {
            irisData[i].removeFirst()
            irisData[i].removeLast()
        }
        
        let data = irisData.map{ row in
            return row.enumerated().map {
                Double($0.element)!
            }
        }
        
        return (data, labels)
    }
    
}
