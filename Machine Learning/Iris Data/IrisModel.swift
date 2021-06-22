//
//  IrisModel.swift
//  Machine Learning
//
//  Created by Felipe Santana on 18/06/21.
//

import Foundation

struct Iris {
    
    var id: Int
    var sepalLengthCm: Double
    var sepalWidthCm: Double
    var petalLengthCm: Double
    var petalWidthCm: Double
    var species: String

    init (raw: [String]) {
        
        id = Int(raw[0]) ?? 0
        sepalLengthCm = Double(raw[1]) ?? 0
        sepalWidthCm = Double(raw[2]) ?? 0
        petalLengthCm = Double(raw[3]) ?? 0
        petalWidthCm = Double(raw[4]) ?? 0
        species = raw[5]
        
    }
}
