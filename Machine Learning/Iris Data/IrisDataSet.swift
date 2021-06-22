//
//  Iris Data.swift
//  Machine Learning
//
//  Created by Felipe Santana on 18/06/21.
//

import Foundation

class IrisDataSet: IrisDataSetProtocol {
    
    static public func getIrisDataSet() -> [Iris] {
        
        let data = transformIrisCSVToStruct(csvName: "Iris")
        
        return data
        
    }
    
    static public func irisTestTrainSplit(testSize: Float) -> ([Iris],[Iris]) {
        let irisData = transformIrisCSVToStruct(csvName: "Iris")
        
        let sizeOfTest = Float(irisData.count) * testSize
        
        var testIndex: [Int] = []
        var trainIndex: [Int] = []
        
        var train: [Iris] = []
        var test: [Iris] = []
        
        while testIndex.count < Int(sizeOfTest) {
            let random = Int.random(in: 0...irisData.count - 1)
            
            if (!testIndex.contains(random)) {
                testIndex.append(random)
                test.append(irisData[random])
            }
        }
        
        for i in 0...irisData.count - 1 {
            
            if (!testIndex.contains(i)) {
                trainIndex.append(i)
                train.append(irisData[i])
            }
        }
        
        return (test, train)
    }
    
    static public func transformIrisCSVToStruct(csvName: String) -> [Iris] {
        
        var csvToStruct = [Iris]()
        
        // Carregamos os dados em formato de string longa
        let csvInString = CSVLoader.loadCSV(from: csvName)
        
        
        
        // Dividimos os dados por linha
        var rows = csvInString.components(separatedBy: "\n")
        
        // Contamos o número de cabeçalhos para comparar depois
        let columnCount = rows.first?.components(separatedBy: ",").count
        
        // Removemos a linha com os nomes de cada coluna
        rows.removeFirst()
        
        let irisData = rows.map {
            
        }
        // Dividimos cada linha por colunas
        for row in rows {
            let csvColumns = row.components(separatedBy: ",")
            
            if csvColumns.count == columnCount {
                let irisStruct = Iris.init(raw: csvColumns)
                csvToStruct.append(irisStruct)
            }
            
        }
        
        return csvToStruct
    }
}
