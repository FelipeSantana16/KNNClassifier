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
     
        IrisDataSet.transformIrisCSVToStruct(csvName: "Iris")
    }

}
