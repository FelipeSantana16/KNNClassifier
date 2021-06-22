//
//  CSVLoader.swift
//  Machine Learning
//
//  Created by Felipe Santana on 18/06/21.
//

import Foundation

class CSVLoader {
    
    static public func loadCSV(from csvName: String) -> String {
        
        var data = ""
        
        if let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") {
            
            do {
                data = try String(contentsOfFile: filePath)
                return data
            }
            catch {
                print("Não foi possível fazer o parse para String!")
                print(error)
                return ""
            }
            
        }
        
        print("Não foi possível encontrar o arquivo!")
        return ""
    }
    
}
